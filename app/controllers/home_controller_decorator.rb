HomeController.class_eval do

  before_filter :ensure_domain


  def ensure_domain
    app_domain = 'www.mylunchin.com'
    # if Rails.env.production? && request.env['HTTP_HOST'] != "mylunchin.herokuapp.com"
    #   render :splash, :layout => false
    # end
    if Rails.env.production? && request.env['HTTP_HOST'] != app_domain
      # HTTP 301 is a "permanent" redirect
      redirect_to "http://#{app_domain}", :status => 301
    end
  end

  def about
    
  end
  
  def seasonal
    
  end
  
  def pending

  end

end