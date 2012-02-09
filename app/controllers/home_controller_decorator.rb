HomeController.class_eval do

  #before_filter :ensure_domain

  APP_DOMAIN = 'www.mylunchin.com'

  def ensure_domain
    if Rails.env.production? && request.env['HTTP_HOST'] != "mylunchin.herokuapp.com"
      render :splash, :layout => false
    end
    # if Rails.env.production? && request.env['HTTP_HOST'] != APP_DOMAIN
    #   # HTTP 301 is a "permanent" redirect
    #   redirect_to "http://#{APP_DOMAIN}", :status => 301
    # end
  end

  def about
    
  end
  
  def seasonal
    
  end
  
  def pending

  end

end