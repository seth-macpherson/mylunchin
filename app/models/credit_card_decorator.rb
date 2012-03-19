Creditcard.class_eval do

  def gateway_error(error)
    if error.is_a? ActiveMerchant::Billing::Response
      text = error.params['message'] || error.params['response_reason_text'] || error.message
    elsif error.is_a? ActiveMerchant::ConnectionError
      text = I18n.t(:unable_to_connect_to_gateway)
    else
      text = error.to_s
    end
    logger.error(I18n.t('gateway_error'))
    logger.error("  #{error.to_yaml}")
    raise Spree::GatewayError.new(text)
  end

end