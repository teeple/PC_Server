class RenameColumnInActionDeducts < ActiveRecord::Migration
  def self.up
  	remove_column :action_deducts, :disfactor
  	remove_column :action_deducts, :unitrate
  	remove_column :action_deducts, :rate
  	remove_column :action_deducts, :amount
	add_column :action_deducts, :operation, :string
	add_column :action_deducts, :start_value, :integer
	add_column :action_deducts, :end_value, :integer
	add_column :action_deducts, :tariff_id, :integer 
  end

  def self.down
  	add_column :action_deducts, :disfactor, :string 
  	add_column :action_deducts, :unitrate, :integer 
  	add_column :action_deducts, :rate, 	:integer
  	add_column :action_deducts, :amount, :integer
	remove_column :action_deducts, :operation
	remove_column :action_deducts, :start_value
	remove_column :action_deducts, :end_value
	remove_column :action_deducts, :tariff_id
  end
end
