namespace :mylunchin do
  desc "Creates delivery and pickup slots for orders"
  task :fix => :environment do
    puts "This should not be run any longer"
    # ActiveRecord::Base.transaction do
    #   Order.select("orders.special_instructions, shipments.id as ship_id, shipments.state").joins(:shipments).where("shipments.state = 'ready'").each do |o| 
    #     Shipment.find(o.ship_id).update_attribute(:shipped_at, o.special_instructions)
    #   end
    # end
  end  
end