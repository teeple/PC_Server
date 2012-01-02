class RemoveColumnsInActionDeducts < ActiveRecord::Migration
  def self.up
  	remove_column :action_deducts, :operation
  	remove_column :action_deducts, :tariff_id
  	remove_column :action_deducts, :upto_type
  	remove_column :action_deducts, :upto_start
  	remove_column :action_deducts, :upto_end
  end

  def self.down
  	add_column :action_deducts, :operation, :string
  	add_column :action_deducts, :tariff_id, :integer
  	add_column :action_deducts, :upto_type, :string
  	add_column :action_deducts, :upto_start, :integer
  	add_column :action_deducts, :upto_end, :integer
  end
end
