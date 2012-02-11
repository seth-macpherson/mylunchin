Admin::ReturnAuthorizationsController.class_eval do
  def fire
    @return_authorization.send("#{params[:e]}!")
    flash.notice = t('return_authorization_updated')
    respond_with(@return_authorization) { |format| format.html { redirect_back_or_default(admin_orders_path) } }
  end
end
