CheckoutController.class_eval do

  # before_filter :amend_state_machine
  # rescue_from Spree::GatewayError, :with => :rescue_from_spree_gateway_error

  def update
    if @order.update_attributes(object_params)

      fire_event('spree.checkout.update')
      if @order.respond_to?(:coupon_code) && @order.coupon_code.present?
        fire_event('spree.checkout.coupon_code_added', :coupon_code => @order.coupon_code)
      end

      if @order.next
        state_callback(:after)
      else
        @order.payment.log_entries.create(:details => @order.gateway_response)
        flash[:error] = @order.gateway_response
        respond_with(@order, :location => checkout_state_path('payment'))
        return
      end

      if @order.state == "complete" || @order.completed?
        flash[:notice] = I18n.t(:order_processed_successfully)
        flash[:commerce_tracking] = "nothing special"
        respond_with(@order, :location => completion_route)
      else
        respond_with(@order, :location => checkout_state_path(@order.state))
      end
    else
      respond_with(@order) { |format| format.html { render :edit } }
    end
  end

  #
  # def amend_state_machine
  #   before_transition :to => 'complete' do |order|
  #     begin
  #       order.process_payments!
  #     rescue Spree::GatewayError => ge
  #       # puts "ZAP:#{ge.message}"
  #       if Spree::Config[:allow_checkout_on_gateway_error]
  #         true
  #       else
  #         false
  #       end
  #     end
  #   end
  #
  #   self.state_events.create({
  #     :previous_state => "payment",
  #     :next_state     => "complete",
  #     :name           => "order",
  #     :user_id        => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
  #   })
  #
  #
  # end
  #
  # # Finalizes an in progress order after checkout is complete.
  # # Called after transition to complete state when payments will have been processed
  # def finalize!
  #   update_attribute(:completed_at, Time.now)
  #   InventoryUnit.assign_opening_inventory(self)
  #   # lock any optional adjustments (coupon promotions, etc.)
  #   adjustments.optional.each { |adjustment| adjustment.update_attribute("locked", true) }
  #   OrderMailer.confirm_email(self).deliver
  #
  #   self.state_events.create({
  #     :previous_state => "cart",
  #     :next_state     => "complete",
  #     :name           => "order" ,
  #     :user_id        => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
  #   })
  # end
  #
  #
  #


end