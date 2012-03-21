Order.class_eval do

  # attr_accessible :line_items, :bill_address_attributes, :ship_address_attributes, :payments_attributes,
  #                 :ship_address, :line_items_attributes,
  #                 :shipping_method_id, :email, :use_billing, :special_instructions, :state
  #

  attr_accessible :gateway_response
  attr_accessor :gateway_response


  def rate_hash
    @rate_hash ||= available_shipping_methods(:front_end).collect do |ship_method|
      next unless cost = ship_method.calculator.compute(self)
      { :id => ship_method.id,
        :shipping_method => ship_method,
        :name => ship_method.name,
        :cost => cost,
        :time => ship_method.time,
        :deadline => ship_method.deadline,
        :location => ship_method.location,
        :pickup_only => ship_method.pickup_only,
        :cutoff => ship_method.cutoff
      }
    end.compact.sort_by{|r| r[:deadline] + r[:pickup_only].to_s}
  end

  def fulfilled
    # a rediculous work-around to allow for state change that doesn't break the state_machine while in production
    ActiveRecord::Base.connection.execute("UPDATE Orders SET state = 'fulfilled' where orders.id = '#{id}'")
  end



  # We can get infinite recursion if these options are applied more than once.  So ensure
  # we are the one and only one.
  raise "can't patch more than once" if defined?(self.sf_ensure_only_once)
  def self.sf_ensure_only_once
  end

  state_machines[:state] = nil    # reset original state machine to start from scratch.

  # We know that there will be preexisting methods from the original Spree state machine.
  # Until there's a better API to update a state machine, just ignore the conflicts by
  # overriding the old ones.  Ideally the state_machine gem would provide a way to delete
  # an existing machine.
  StateMachine::Machine.ignore_method_conflicts = true

  # This is a modified version of the original spree shipment state machine
  # with the indicated changes.
  state_machine :initial => :cart, :use_transactions => false do

    event :next do
      transition :from => 'cart',     :to => 'address'
      transition :from => 'address',  :to => 'delivery'
      transition :from => 'delivery', :to => 'payment', :if => :payment_required?
      transition :from => 'delivery', :to => 'complete'
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
      rescue Spree::GatewayError => err
        order.gateway_response = err.message
        if Spree::Config[:allow_checkout_on_gateway_error]
          true
        else
          false
        end
      end
    end

    after_transition :to => 'complete', :do => :finalize!
    after_transition :to => 'delivery', :do => :create_tax_charge!
    after_transition :to => 'payment', :do => :create_shipment!
    after_transition :to => 'canceled', :do => :after_cancel

  end


end