# this clas was inspired (heavily) from the mephisto admin architecture
Admin::OverviewController.class_eval do

  def index
    @show_dashboard = show_dashboard
    return unless @show_dashboard

    p = {:from => (Time.new().to_date  - 1.week).to_s(:db), :value => "Count"}
    @orders_by_day = orders_by_day(p)
    @orders_line_total = orders_line_total(p)
    @orders_total = orders_total(p)
    @orders_adjustment_total = orders_adjustment_total(p)
    @orders_credit_total = orders_credit_total(p)

    @best_selling_variants = best_selling_variants
    @top_grossing_variants = top_grossing_variants
    @last_five_orders = last_five_orders
    @biggest_spenders = biggest_spenders
    @out_of_stock_products = out_of_stock_products
    # @best_selling_taxons = best_selling_taxons

    @pie_colors = [ "#0093DA", "#FF3500", "#92DB00", "#1AB3FF", "#FFB800"]
  end

end
