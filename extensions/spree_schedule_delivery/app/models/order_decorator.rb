Order.class_eval do

  # We can get infinite recursion if these options are applied more than once.  So ensure
  # we are the one and only one.
  raise "Order has been patched. Please refresh." if defined?(self.sf_ensure_only_once)
  def self.sf_ensure_only_once
  end

  # scope :fulfilling, where(:state => 'fulfilling')
  # scope :fulfill_failed, where(:state => 'fulfill_fail')

  state_machines[:state] = nil    # reset original state machine to start from scratch.

  # We know that there will be preexisting methods from the original Spree state machine.
  # Until there's a better API to update a state machine, just ignore the conflicts by
  # overriding the old ones.  Ideally the state_machine gem would provide a way to delete
  # an existing machine.
  StateMachine::Machine.ignore_method_conflicts = true

  # This is a modified version of the original spree Order state machine
  # with the indicated changes.
  # customize the checkout state machine
  Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart') do

    after_transition :to => 'complete', :do => :complete_order
    before_transition :to => 'complete', :do => :process_payment

    event :next do
      puts "ORDER_DECORATOR!!!"
      # skip address all together if we can
      transition :from => 'cart',     :to => 'schedule'
      # go straight to schedule
      transition :from => 'schedule', :to => 'payment', :if => :payment_required?
      # after this line it's a direct copy of the state_machine within order.rb
      transition :from => 'schedule', :to => 'complete'
      transition :from => 'confirm',  :to => 'complete'

      # note: some payment methods will not support a confirm step
      transition :from => 'payment',  :to => 'confirm',
                                      :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }

      transition :from => 'payment', :to => 'complete'
    end

    event :cancel do
      transition :to => 'canceled', :if => :allow_cancel?
    end
    event :return do
      transition :to => 'returned', :from => 'awaiting_return'
    end
    event :resume do
      transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
    end
    event :authorize_return do
      transition :to => 'awaiting_return'
    end

    before_transition :to => 'complete' do |order|
      begin
        order.process_payments!
      rescue Spree::GatewayError
        if Spree::Config[:allow_checkout_on_gateway_error]
          true
        else
          false
        end
      end
    end

    after_transition :to => 'complete', :do => :finalize!
    after_transition :to => 'schedule', :do => :create_tax_charge!
    after_transition :to => 'payment', :do => :create_shipment!
    after_transition :to => 'canceled', :do => :after_cancel

  end

  # def valid_tracking?
  #   tracking && tracking['::']
  # end

  # If there's an error submitting to the fulfillment service, we should halt
  # the transition to 'fulfill' and stay in 'ready'.  That way transient errors
  # will get rehandled.  If there are persistent errors, that should be treated
  # as a bug.


  # def before_fulfilling
  #   Fulfillment.log "before_fulfilling start"
  #   if valid_tracking?
  #     Fulfillment.log "skipping warehouse fulfillment - existing tracking code #{tracking}"
  #   else
  #     Fulfillment.fulfill(self)     # throws :halt on error, which aborts transition
  #   end
  #   Fulfillment.log "before_fulfilling end"
  # end

  # Know about our new state - do not erase it accidentally.
  # alias_method :orig_determine_state, :determine_state
  # def determine_state(order)
  #   return state if ['fulfilling', 'fulfill_fail', 'shipped'].include?(state)
  #   return 'shipped' if valid_tracking?
  #   orig_determine_state(order)
  # end


end
