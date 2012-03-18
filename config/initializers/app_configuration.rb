puts "Loading custom app configuration settings"
Spree::Config.set(
  :auto_capture => true,
  :products_per_page => 50,
  :orders_per_page => 50,
  :admin_products_per_page => 25
)

