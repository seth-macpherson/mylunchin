Mylunchin::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this) (set to false before deploying)
  config.serve_static_assets = false
  puts "config.serve_static_assets: #{config.serve_static_assets} (should be false)"

  # Compress JavaScripts and CSS (defaults: true)
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed (defaults: false)
  config.assets.compile = true

  # Generate digests for assets URLs (defaults: true)
  config.assets.digest = true

  # Defaults to Rails.root.join("public/assets")
  # config.assets.manifest = Rails.root.join("public/assets")

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = false

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Use a different logger for distributed setups
  # config.logger = SyslogLogger.new

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store, Memcached::Rails.new
  #
  # $cache = Memcache.new
  # config.middleware.use Rack::Cache, :metastore => $cache, :entitystore => 'file:tmp/cache/entity'



  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( extras/*.js )
  config.assets.precompile += ['store/all.*', 'admin/all.*', 'admin/spree_dash.*', 'admin/orders/edit_form.js', 'admin/address_states.js', 'jqPlot/excanvas.min.js', 'admin/images/new.js', 'jquery.jstree/themes/apple/*', 'store/flexi-variants.css', 'jquery.validate/*']

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable threaded mode
  # config.threadsafe!

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify
end
