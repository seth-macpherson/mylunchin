Admin::MailMethodsController.class_eval do

  def testmail
    @mail_method = MailMethod.find(params[:id])
    if TestMailer.test_email(@mail_method, current_user).deliver
      flash[:notice] = t("admin.mail_methods.testmail.delivery_success")
    else
      flash[:error] = t("admin.mail_methods.testmail.delivery_error")
    end
  rescue Exception => e
    flash[:error] = t("admin.mail_methods.testmail.error") % {:e => e}
  ensure
    respond_with(@mail_method) { |format| format.html { redirect_to admin_mail_methods_path } }
  end

end
