class AddNameColumnsInActionsConditions < ActiveRecord::Migration
  def self.up
  	add_column :who_factors, :name, :string
  	add_column :when_factors, :name, :string
  	add_column :where_factors, :name, :string
  	add_column :action_allows, :subfctr_code, :string
  	add_column :action_discounts, :subfctr_code, :string
  	add_column :action_deducts, :subfctr_code, :string
  end

  def self.down
  	remove_column :who_factors, :name
  	remove_column :when_factors, :name
  	remove_column :where_factors, :name
  	remove_column :action_allows, :subfctr_code
  	remove_column :action_discounts, :subfctr_code
  	remove_column :action_deducts, :subfctr_code
  end
end
