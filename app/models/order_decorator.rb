Order.class_eval do

  attr_accessible :line_items, :bill_address_attributes, :ship_address_attributes, :payments_attributes,
                  :ship_address, :line_items_attributes,
                  :shipping_method_id, :email, :use_billing, :special_instructions, :state

  
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

end