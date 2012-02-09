Order.class_eval do
  
  puts "ORDER DECORATORED"
  
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
 
end
  # # customize the checkout state machine
  # Order.state_machines[:state] = StateMachine::Machine.new(Order, :initial => 'cart') do
  # 
  #   puts "ORDER_DECORATOR!!!"
  # 
  #   after_transition :to => 'complete', :do => :complete_order
  #   before_transition :to => 'complete', :do => :process_payment
  # 
  #   event :next do
  #     transition :from => 'cart',     :to => 'schedule'
  #     transition :from => 'schedule', :to => 'payment', :if => :payment_required?
  #     transition :from => 'schedule', :to => 'complete'
  #     transition :from => 'confirm',  :to => 'complete'
  # 
  #     # note: some payment methods will not support a confirm step
  #     transition :from => 'payment',  :to => 'confirm',
  #                                     :if => Proc.new { Gateway.current && Gateway.current.payment_profiles_supported? }
  # 
  #     transition :from => 'payment', :to => 'complete'
  #   end
  # 
  #   event :cancel do
  #     transition :to => 'canceled', :if => :allow_cancel?
  #   end
  #   event :return do
  #     transition :to => 'returned', :from => 'awaiting_return'
  #   end
  #   event :resume do
  #     transition :to => 'resumed', :from => 'canceled', :if => :allow_resume?
  #   end
  #   event :authorize_return do
  #     transition :to => 'awaiting_return'
  #   end
  # 
  #   before_transition :to => 'complete' do |order|
  #     begin
  #       order.process_payments!
  #     rescue Spree::GatewayError
  #       if Spree::Config[:allow_checkout_on_gateway_error]
  #         true
  #       else
  #         false
  #       end
  #     end
  #   end
  # 
  #   after_transition :to => 'complete', :do => :finalize!
  #   after_transition :to => 'schedule', :do => :create_tax_charge!
  #   after_transition :to => 'payment', :do => :create_shipment!
  #   after_transition :to => 'canceled', :do => :after_cancel
  #  
  # end
