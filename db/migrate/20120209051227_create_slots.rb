class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.string :order_time
      t.string :delivery_time
      t.string :delivery_location
      t.string :pickup_time
      t.string :pickup_location

      t.timestamps
    end
  end
end
