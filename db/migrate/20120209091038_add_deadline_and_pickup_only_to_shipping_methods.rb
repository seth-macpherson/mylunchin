class AddDeadlineAndPickupOnlyToShippingMethods < ActiveRecord::Migration
  def self.up
    add_column :shipping_methods, :deadline, :string
    add_column :shipping_methods, :pickup_only, :boolean, :default => false
  end

  def self.down
    remove_column :shipping_methods, :deadline
    remove_column :shipping_methods, :pickup_only
  end
end
