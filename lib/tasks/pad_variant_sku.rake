namespace :mylunchin do
  desc "Pad out the variant sku with zeros so we can sort easily and still refer to it as a string"
  task :pad_sku => :environment do
    Variant.find_each { |v| v.update_attribute(:sku, "%05d" % v.sku.to_i)} 
  end

end
