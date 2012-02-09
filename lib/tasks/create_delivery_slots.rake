namespace :mylunchin do
  desc "Creates delivery and pickup slots for orders"
  task :slots => :environment do

    waterfront = '<div class="location">Hood River Waterfront:</div>489 Building <span class="hint">(the old United Telephone Services building, new home of Hood Tech), main lobby, northeast entrance</span>'
    waucoma    = '<div class="location">Waucoma Building:</div>Main entrance on Wasco St.'
    insitu     = '<div class="location">Insitu:</div>The winery building in Bingen, WA'

    slots = Slot.create([{ 
      order_time: '10:00',
      delivery_time: '11:30',
      delivery_location: waucoma,
      pickup_time: '11:30',
      pickup_location: "Nora's Table"
      },{
      order_time: '10:15',
      delivery_time: '11:45',
      delivery_location: waterfront,
      pickup_time: '11:45',
      pickup_location: "Nora's Table"
      },{
      order_time: '10:30',
      delivery_time: '12:00',
      delivery_location: insitu,
      pickup_time: '12:00',
      pickup_location: "Nora's Table"
      },{
      order_time: '10:45',
      pickup_time: '12:15',
      pickup_location: "Nora's Table"
      },{
      order_time: '11:00',
      delivery_time: '12:30',
      delivery_location: waucoma,
      pickup_time: '12:30',
      pickup_location: "Nora's Table"
      },{
      order_time: '11:15',
      delivery_time: '12:45',
      delivery_location: waterfront,
      pickup_time: '12:45',
      pickup_location: "Nora's Table"
      },{
      order_time: '11:30',
      delivery_time: '1:00',
      delivery_location: insitu,
      pickup_time: '1:00',
      pickup_location: "Nora's Table"
      },{
      order_time: '11:45',
      pickup_time: '1:15',
      pickup_location: "Nora's Table"
      },{
      order_time: '12:00',
      pickup_time: '1:30',
      pickup_location: "Nora's Table"
      },{
      order_time: '12:15',
      pickup_time: '1:45',
      pickup_location: "Nora's Table"
      },{
      order_time: '12:30',
      pickup_time: '2:00',
      pickup_location: "Nora's Table"
    }])    
  end

end
