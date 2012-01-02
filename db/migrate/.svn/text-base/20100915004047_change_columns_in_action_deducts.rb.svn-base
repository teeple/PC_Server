class ChangeColumnsInActionDeducts < ActiveRecord::Migration
  def self.up
  	remove_column :action_deducts, :upto
  	remove_column :action_deducts, :start_value
  	remove_column :action_deducts, :end_value
	add_column :action_deducts, :upto_start, :integer
	add_column :action_deducts, :upto_end, :integer
  end

  def self.down
  	add_column :action_deducts, :upto, :integer
  	add_column :action_deducts, :start_value, :integer 
  	add_column :action_deducts, :end_value, :integer 
	remove_column :action_deducts, :upto_start
	remove_column :action_deducts, :upto_end
  end
end
