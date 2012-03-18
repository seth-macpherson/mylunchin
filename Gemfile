source 'http://rubygems.org'

<<<<<<< HEAD
gem 'json'
gem 'sqlite3'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.4"
  gem 'coffee-rails', "~> 3.1.1"
  gem 'uglifier'
end

group :test do
  gem 'guard'
  gem 'guard-rspec', '~> 0.5.0'
  gem 'rspec-rails', '~> 2.8.0'
  gem 'factory_girl_rails', '~> 1.5.0'

  platform :ruby_18 do
    gem 'rcov'
  end

  platform :ruby_19 do
    gem 'simplecov'
  end

  gem 'ffaker'
  gem 'shoulda-matchers', '~> 1.0.0'
  gem 'capybara'
  gem 'selenium-webdriver', '2.16.0'
  gem 'database_cleaner', '0.7.1'
  gem 'launchy'
end

group :ci do
  gem 'mysql2', '~> 0.3.6'
end

# platform :ruby_18 do
#   gem "ruby-debug"
# end

# platform :ruby_19 do
#   gem "ruby-debug19"
# end

gemspec
=======
gem 'rails', '3.1.1'
gem 'unicorn'
# gem 'rack-cache'
# gem 'dalli'

gem 'aws-sdk'
gem 'pg'
gem 'yaml_db'
gem 'rmagick'
gem 'chronic'
gem 'carrierwave', '0.5.6'
gem 'spree',                 :git  => 'git://github.com/seth-macpherson/spree.git', :branch => '0-70-stable'
gem 'spree_flexi_variants',  :git  => 'git://github.com/seth-macpherson/spree_flexi_variants.git'
gem 'spree_last_address',    :git  => "git://github.com/seth-macpherson/spree-last-address.git"
gem 'spree_heroku', '1.0.0', :git  => 'git://github.com/seth-macpherson/spree-heroku.git'
# gem 'spree_social',          :git  => 'git://github.com/seth-macpherson/spree_social.git'
gem 'aws-s3'

# incomplete - taking too long to implement
# gem 'spree_schedule_delivery', :path => './vendor/ruby/1.9.1/bundler/gems/spree_schedule_delivery'

gem 'mail'
gem 'feedzirra'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do

  gem 'rspec'
  gem 'spork', '0.8.5'
  gem 'rb-fsevent'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rspec-rails'
  gem 'rspec-instafail'

  # db, factory & code coverage
  gem 'factory_girl_rails'
  gem 'simplecov', '>= 0.4.2', :require => false, :group => :test
  gem 'simplecov-rcov'
  # Niceties
  gem 'growl'
  gem 'faker'
  gem 'turn', :require => false

end
>>>>>>> 1.1


