# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{activemerchant}
  s.version = "1.17.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tobias Luetke"]
  s.cert_chain = ["-----BEGIN CERTIFICATE-----\nMIIDNjCCAh6gAwIBAgIBADANBgkqhkiG9w0BAQUFADBBMRMwEQYDVQQDDApjb2R5\nZmF1c2VyMRUwEwYKCZImiZPyLGQBGRYFZ21haWwxEzARBgoJkiaJk/IsZAEZFgNj\nb20wHhcNMDcwMjIyMTcyMTI3WhcNMDgwMjIyMTcyMTI3WjBBMRMwEQYDVQQDDApj\nb2R5ZmF1c2VyMRUwEwYKCZImiZPyLGQBGRYFZ21haWwxEzARBgoJkiaJk/IsZAEZ\nFgNjb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC6T4Iqt5iWvAlU\niXI6L8UO0URQhIC65X/gJ9hL/x4lwSl/ckVm/R/bPrJGmifT+YooFv824N3y/TIX\n25o/lZtRj1TUZJK4OCb0aVzosQVxBHSe6rLmxO8cItNTMOM9wn3thaITFrTa1DOQ\nO3wqEjvW2L6VMozVfK1MfjL9IGgy0rCnl+2g4Gh4jDDpkLfnMG5CWI6cTCf3C1ye\nytOpWgi0XpOEy8nQWcFmt/KCQ/kFfzBo4QxqJi54b80842EyvzWT9OB7Oew/CXZG\nF2yIHtiYxonz6N09vvSzq4CvEuisoUFLKZnktndxMEBKwJU3XeSHAbuS7ix40OKO\nWKuI54fHAgMBAAGjOTA3MAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0GA1UdDgQW\nBBR9QQpefI3oDCAxiqJW/3Gg6jI6qjANBgkqhkiG9w0BAQUFAAOCAQEAs0lX26O+\nHpyMp7WL+SgZuM8k76AjfOHuKajl2GEn3S8pWYGpsa0xu07HtehJhKLiavrfUYeE\nqlFtyYMUyOh6/1S2vfkH6VqjX7mWjoi7XKHW/99fkMS40B5SbN+ypAUst+6c5R84\nw390mjtLHpdDE6WQYhS6bFvBN53vK6jG3DLyCJc0K9uMQ7gdHWoxq7RnG92ncQpT\nThpRA+fky5Xt2Q63YJDnJpkYAz79QIama1enSnd4jslKzSl89JS2luq/zioPe/Us\nhbyalWR1+HrhgPoSPq7nk+s2FQUBJ9UZFK1lgMzho/4fZgzJwbu+cO8SNuaLS/bj\nhPaSTyVU0yCSnw==\n-----END CERTIFICATE-----\n"]
  s.date = %q{2011-08-22}
  s.description = %q{Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways.}
  s.email = %q{tobi@leetsoft.com}
  s.files = ["CHANGELOG", "MIT-LICENSE", "CONTRIBUTORS", "gem-public_cert.pem", "lib/active_merchant/billing/avs_result.rb", "lib/active_merchant/billing/base.rb", "lib/active_merchant/billing/check.rb", "lib/active_merchant/billing/credit_card.rb", "lib/active_merchant/billing/credit_card_formatting.rb", "lib/active_merchant/billing/credit_card_methods.rb", "lib/active_merchant/billing/cvv_result.rb", "lib/active_merchant/billing/expiry_date.rb", "lib/active_merchant/billing/gateway.rb", "lib/active_merchant/billing/gateways/authorize_net.rb", "lib/active_merchant/billing/gateways/authorize_net_cim.rb", "lib/active_merchant/billing/gateways/barclays_epdq.rb", "lib/active_merchant/billing/gateways/beanstream/beanstream_core.rb", "lib/active_merchant/billing/gateways/beanstream.rb", "lib/active_merchant/billing/gateways/beanstream_interac.rb", "lib/active_merchant/billing/gateways/blue_pay.rb", "lib/active_merchant/billing/gateways/bogus.rb", "lib/active_merchant/billing/gateways/braintree/braintree_common.rb", "lib/active_merchant/billing/gateways/braintree.rb", "lib/active_merchant/billing/gateways/braintree_blue.rb", "lib/active_merchant/billing/gateways/braintree_orange.rb", "lib/active_merchant/billing/gateways/card_save.rb", "lib/active_merchant/billing/gateways/card_stream.rb", "lib/active_merchant/billing/gateways/cyber_source.rb", "lib/active_merchant/billing/gateways/data_cash.rb", "lib/active_merchant/billing/gateways/efsnet.rb", "lib/active_merchant/billing/gateways/elavon.rb", "lib/active_merchant/billing/gateways/epay.rb", "lib/active_merchant/billing/gateways/eway.rb", "lib/active_merchant/billing/gateways/eway_managed.rb", "lib/active_merchant/billing/gateways/exact.rb", "lib/active_merchant/billing/gateways/federated_canada.rb", "lib/active_merchant/billing/gateways/first_pay.rb", "lib/active_merchant/billing/gateways/garanti.rb", "lib/active_merchant/billing/gateways/ideal/ideal_base.rb", "lib/active_merchant/billing/gateways/ideal/ideal_rabobank.pem", "lib/active_merchant/billing/gateways/ideal/ideal_response.rb", "lib/active_merchant/billing/gateways/ideal_rabobank.rb", "lib/active_merchant/billing/gateways/inspire.rb", "lib/active_merchant/billing/gateways/instapay.rb", "lib/active_merchant/billing/gateways/iridium.rb", "lib/active_merchant/billing/gateways/jetpay.rb", "lib/active_merchant/billing/gateways/linkpoint.rb", "lib/active_merchant/billing/gateways/merchant_e_solutions.rb", "lib/active_merchant/billing/gateways/merchant_ware.rb", "lib/active_merchant/billing/gateways/modern_payments.rb", "lib/active_merchant/billing/gateways/modern_payments_cim.rb", "lib/active_merchant/billing/gateways/moneris.rb", "lib/active_merchant/billing/gateways/net_registry.rb", "lib/active_merchant/billing/gateways/netaxept.rb", "lib/active_merchant/billing/gateways/netbilling.rb", "lib/active_merchant/billing/gateways/nmi.rb", "lib/active_merchant/billing/gateways/ogone.rb", "lib/active_merchant/billing/gateways/optimal_payment.rb", "lib/active_merchant/billing/gateways/orbital/orbital_soft_descriptors.rb", "lib/active_merchant/billing/gateways/orbital.rb", "lib/active_merchant/billing/gateways/pay_junction.rb", "lib/active_merchant/billing/gateways/pay_secure.rb", "lib/active_merchant/billing/gateways/paybox_direct.rb", "lib/active_merchant/billing/gateways/payflow/payflow_common_api.rb", "lib/active_merchant/billing/gateways/payflow/payflow_express_response.rb", "lib/active_merchant/billing/gateways/payflow/payflow_response.rb", "lib/active_merchant/billing/gateways/payflow.rb", "lib/active_merchant/billing/gateways/payflow_express.rb", "lib/active_merchant/billing/gateways/payflow_express_uk.rb", "lib/active_merchant/billing/gateways/payflow_uk.rb", "lib/active_merchant/billing/gateways/payment_express.rb", "lib/active_merchant/billing/gateways/paypal/paypal_common_api.rb", "lib/active_merchant/billing/gateways/paypal/paypal_express_response.rb", "lib/active_merchant/billing/gateways/paypal.rb", "lib/active_merchant/billing/gateways/paypal_ca.rb", "lib/active_merchant/billing/gateways/paypal_express.rb", "lib/active_merchant/billing/gateways/paypal_express_common.rb", "lib/active_merchant/billing/gateways/paystation.rb", "lib/active_merchant/billing/gateways/plugnpay.rb", "lib/active_merchant/billing/gateways/psigate.rb", "lib/active_merchant/billing/gateways/psl_card.rb", "lib/active_merchant/billing/gateways/qbms.rb", "lib/active_merchant/billing/gateways/quantum.rb", "lib/active_merchant/billing/gateways/quickpay.rb", "lib/active_merchant/billing/gateways/realex.rb", "lib/active_merchant/billing/gateways/sage/sage_bankcard.rb", "lib/active_merchant/billing/gateways/sage/sage_core.rb", "lib/active_merchant/billing/gateways/sage/sage_virtual_check.rb", "lib/active_merchant/billing/gateways/sage.rb", "lib/active_merchant/billing/gateways/sage_pay.rb", "lib/active_merchant/billing/gateways/sallie_mae.rb", "lib/active_merchant/billing/gateways/secure_net.rb", "lib/active_merchant/billing/gateways/secure_pay.rb", "lib/active_merchant/billing/gateways/secure_pay_au.rb", "lib/active_merchant/billing/gateways/secure_pay_tech.rb", "lib/active_merchant/billing/gateways/skip_jack.rb", "lib/active_merchant/billing/gateways/smart_ps.rb", "lib/active_merchant/billing/gateways/stripe.rb", "lib/active_merchant/billing/gateways/trans_first.rb", "lib/active_merchant/billing/gateways/transax.rb", "lib/active_merchant/billing/gateways/trust_commerce.rb", "lib/active_merchant/billing/gateways/usa_epay.rb", "lib/active_merchant/billing/gateways/verifi.rb", "lib/active_merchant/billing/gateways/viaklix.rb", "lib/active_merchant/billing/gateways/wirecard.rb", "lib/active_merchant/billing/gateways/worldpay.rb", "lib/active_merchant/billing/gateways.rb", "lib/active_merchant/billing/integrations/action_view_helper.rb", "lib/active_merchant/billing/integrations/bogus/helper.rb", "lib/active_merchant/billing/integrations/bogus/notification.rb", "lib/active_merchant/billing/integrations/bogus/return.rb", "lib/active_merchant/billing/integrations/bogus.rb", "lib/active_merchant/billing/integrations/chronopay/helper.rb", "lib/active_merchant/billing/integrations/chronopay/notification.rb", "lib/active_merchant/billing/integrations/chronopay/return.rb", "lib/active_merchant/billing/integrations/chronopay.rb", "lib/active_merchant/billing/integrations/direc_pay/helper.rb", "lib/active_merchant/billing/integrations/direc_pay/notification.rb", "lib/active_merchant/billing/integrations/direc_pay/return.rb", "lib/active_merchant/billing/integrations/direc_pay/status.rb", "lib/active_merchant/billing/integrations/direc_pay.rb", "lib/active_merchant/billing/integrations/directebanking/helper.rb", "lib/active_merchant/billing/integrations/directebanking/notification.rb", "lib/active_merchant/billing/integrations/directebanking/return.rb", "lib/active_merchant/billing/integrations/directebanking.rb", "lib/active_merchant/billing/integrations/e_payment_plans/helper.rb", "lib/active_merchant/billing/integrations/e_payment_plans/notification.rb", "lib/active_merchant/billing/integrations/e_payment_plans.rb", "lib/active_merchant/billing/integrations/gestpay/common.rb", "lib/active_merchant/billing/integrations/gestpay/helper.rb", "lib/active_merchant/billing/integrations/gestpay/notification.rb", "lib/active_merchant/billing/integrations/gestpay/return.rb", "lib/active_merchant/billing/integrations/gestpay.rb", "lib/active_merchant/billing/integrations/helper.rb", "lib/active_merchant/billing/integrations/hi_trust/helper.rb", "lib/active_merchant/billing/integrations/hi_trust/notification.rb", "lib/active_merchant/billing/integrations/hi_trust/return.rb", "lib/active_merchant/billing/integrations/hi_trust.rb", "lib/active_merchant/billing/integrations/moneybookers/helper.rb", "lib/active_merchant/billing/integrations/moneybookers/notification.rb", "lib/active_merchant/billing/integrations/moneybookers.rb", "lib/active_merchant/billing/integrations/nochex/helper.rb", "lib/active_merchant/billing/integrations/nochex/notification.rb", "lib/active_merchant/billing/integrations/nochex/return.rb", "lib/active_merchant/billing/integrations/nochex.rb", "lib/active_merchant/billing/integrations/notification.rb", "lib/active_merchant/billing/integrations/payflow_link/helper.rb", "lib/active_merchant/billing/integrations/payflow_link/notification.rb", "lib/active_merchant/billing/integrations/payflow_link.rb", "lib/active_merchant/billing/integrations/paypal/helper.rb", "lib/active_merchant/billing/integrations/paypal/notification.rb", "lib/active_merchant/billing/integrations/paypal/return.rb", "lib/active_merchant/billing/integrations/paypal.rb", "lib/active_merchant/billing/integrations/quickpay/helper.rb", "lib/active_merchant/billing/integrations/quickpay/notification.rb", "lib/active_merchant/billing/integrations/quickpay.rb", "lib/active_merchant/billing/integrations/return.rb", "lib/active_merchant/billing/integrations/sage_pay_form/encryption.rb", "lib/active_merchant/billing/integrations/sage_pay_form/helper.rb", "lib/active_merchant/billing/integrations/sage_pay_form/notification.rb", "lib/active_merchant/billing/integrations/sage_pay_form/return.rb", "lib/active_merchant/billing/integrations/sage_pay_form.rb", "lib/active_merchant/billing/integrations/two_checkout/helper.rb", "lib/active_merchant/billing/integrations/two_checkout/notification.rb", "lib/active_merchant/billing/integrations/two_checkout/return.rb", "lib/active_merchant/billing/integrations/two_checkout.rb", "lib/active_merchant/billing/integrations/valitor/helper.rb", "lib/active_merchant/billing/integrations/valitor/notification.rb", "lib/active_merchant/billing/integrations/valitor/response_fields.rb", "lib/active_merchant/billing/integrations/valitor/return.rb", "lib/active_merchant/billing/integrations/valitor.rb", "lib/active_merchant/billing/integrations/world_pay/helper.rb", "lib/active_merchant/billing/integrations/world_pay/notification.rb", "lib/active_merchant/billing/integrations/world_pay.rb", "lib/active_merchant/billing/integrations.rb", "lib/active_merchant/billing/response.rb", "lib/active_merchant/billing.rb", "lib/active_merchant/common/connection.rb", "lib/active_merchant/common/country.rb", "lib/active_merchant/common/error.rb", "lib/active_merchant/common/post_data.rb", "lib/active_merchant/common/posts_data.rb", "lib/active_merchant/common/requires_parameters.rb", "lib/active_merchant/common/utils.rb", "lib/active_merchant/common/validateable.rb", "lib/active_merchant/common.rb", "lib/active_merchant/version.rb", "lib/active_merchant.rb", "lib/activemerchant.rb", "lib/certs/cacert.pem", "lib/support/gateway_support.rb", "lib/support/outbound_hosts.rb"]
  s.homepage = %q{http://activemerchant.org/}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{activemerchant}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Framework and tools for dealing with credit card transactions.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 2.3.11"])
      s.add_runtime_dependency(%q<builder>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<braintree>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<json>, [">= 1.5.1"])
    else
      s.add_dependency(%q<activesupport>, [">= 2.3.11"])
      s.add_dependency(%q<builder>, [">= 2.0.0"])
      s.add_dependency(%q<braintree>, [">= 2.0.0"])
      s.add_dependency(%q<json>, [">= 1.5.1"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 2.3.11"])
    s.add_dependency(%q<builder>, [">= 2.0.0"])
    s.add_dependency(%q<braintree>, [">= 2.0.0"])
    s.add_dependency(%q<json>, [">= 1.5.1"])
  end
end
