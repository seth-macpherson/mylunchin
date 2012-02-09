class AddTimeAndLocationToShippingMethods < ActiveRecord::Migration
  def self.up
    add_column :shipping_methods, :time, :string
    add_column :shipping_methods, :location, :string
  end

  def self.down
    remove_column :shipping_methods, :time
    remove_column :shipping_methods, :location
  end
end
