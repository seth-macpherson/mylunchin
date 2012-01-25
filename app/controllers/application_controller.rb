class ApplicationController < ActionController::Base
  # layout :get_layout
  
  protect_from_forgery

  before_filter :get_blog_feed
  # helper_method :logged_in?, :owner?, :owner_name, :public_route? #also from Devise: :current_user, :user_signed_in?, :user_session

  def get_blog_feed
    # fetching a single feed
    @feed = []# Feedzirra::Feed.fetch_and_parse("http://norastable.wordpress.com/feed/")
  end
  
  def redirect_to_back(default = root_url)
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end

  # The current incomplete order from the session for use in cart and during checkout
  def current_order(create_order_if_necessary = false)
    return @current_order if @current_order
    if session[:order_id]
      @current_order = Order.find_by_id(session[:order_id])
    end
    if create_order_if_necessary and (@current_order.nil? or @current_order.completed?)
      @current_order = Order.new
      @current_order.save!
    end
    session[:order_id] = @current_order ? @current_order.id : nil
    @current_order
  end


  # 
  # def get_user
  #   #set a member variable for the current user
  #   if params[:user_id] #we're in a nested route
  #     @user = User.find(params[:user_id])
  #   else
  #     @user = current_user if user_signed_in?
  #   end
  # end
  # 
  # def logged_in?; user_signed_in?; end
  # 
  # def owner?; current_user == @user; end
  # 
  # def owner_name(possessive=false)
  #   if current_user == @user
  #     "You" + (possessive ? 'r': '')
  #   else
  #     tackon = @user.shortname.chop == "s" ? "'" : "'s" 
  #     @user.shortname + (possessive ? tackon : "")
  #   end
  # end
  # 
  # def authenticate_admin_user!
  #   current_user and current_user.is_admin?
  # end
  # 
  # # TODO change this to not use the path_info
  # def public_route?(path_info=request.env["PATH_INFO"])
  #   paths = path_info.split("/")[1..-1] if path_info.length > 1
  #   case paths[0]
  #   when "performances"
  #     return true
  #   end
  #   return false
  # end

end
