Admin::UsersController.class_eval do
  logger.debug("loading decorated users controller")

  protected

  def collection
    return @collection if @collection.present?
    unless request.xhr?
      puts "Got to the XHR request"
      if params[:search]
        @search = User.includes([:orders]).where("orders.state IN ('fulfilled','complete','payment') AND orders.email #{LIKE} :search",{:search => "#{params[:search][:email_contains].strip}%"}).metasearch
      else
        @search = User.includes([:orders]).where("orders.state = 'fulfilled'").metasearch(params[:search])
      end

      @collection = @search.relation.page(params[:page]).per(Spree::Config[:admin_products_per_page])
    else
      puts "Got to the @collection request"
      #disabling proper nested include here due to rails 3.1 bug
      #@collection = User.includes(:bill_address => [:state, :country], :ship_address => [:state, :country]).
      @collection = User.includes(:bill_address, :ship_address).
                        where("users.email #{LIKE} :search
                               OR addresses.firstname #{LIKE} :search
                               OR addresses.lastname #{LIKE} :search
                               OR ship_addresses_users.firstname #{LIKE} :search
                               OR ship_addresses_users.lastname #{LIKE} :search",
                               {:search => "#{params[:q].strip}%"}).
                        limit(params[:limit] || 100)
    end
  end

end