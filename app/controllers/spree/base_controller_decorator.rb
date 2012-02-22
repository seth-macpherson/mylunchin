Spree::BaseController.class_eval do

  puts "loading base controller decorator"
  
  before_filter :ensure_referrer
  after_filter :store_location

  def ensure_referrer
    request.env["HTTP_REFERER"] = session[:return_to] if request.env["HTTP_REFERER"].blank?
    session[:return_to] = nil
  end

  def store_location
    session[:return_to] =
      if request.get?
        request.url
      else
        request.referer
      end
  end
  
end