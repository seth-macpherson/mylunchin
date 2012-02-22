Admin::ShipmentsController.class_eval do
  def fire
    if @shipment.send("#{params[:e]}")
      flash.notice = t('shipment_updated')
    else
      flash[:error] = t('cannot_perform_operation')
    end

    respond_with(@shipment) { |format| format.html { redirect_back_or_default(admin_orders_path) } }
  end
end
