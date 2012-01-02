class AddDescriptionFieldInPromotions < ActiveRecord::Migration
  def self.up
  	add_column :promotions, :description, :string
  end

  def self.down
  	remove_column :promotions, :description
  end
end
