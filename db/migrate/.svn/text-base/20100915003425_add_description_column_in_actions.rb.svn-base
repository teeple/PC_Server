class AddDescriptionColumnInActions < ActiveRecord::Migration
  def self.up
  	add_column :action_deducts, :description, :string
  	add_column :action_allows, :description, :string
  	add_column :action_discounts, :description, :string
  end

  def self.down
  	remove_column :action_deducts, :description
  	remove_column :action_allows, :description
  	remove_column :action_discounts, :description
  end
end
