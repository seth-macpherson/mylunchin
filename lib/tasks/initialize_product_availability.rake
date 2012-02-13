namespace :mylunchin do
  desc "Make all products available"
  task :enable_products => :environment do
    Product.find_each { |p| p.update_attribute(:available_on, Date.parse('2012-01-01 00:00:00'))} 
  end

end
