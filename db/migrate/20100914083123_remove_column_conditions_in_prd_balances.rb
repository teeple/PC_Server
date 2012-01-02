class RemoveColumnConditionsInPrdBalances < ActiveRecord::Migration
  def self.up
  	remove_column :prd_balances, :condition_id
  	remove_column :prd_balances, :condition_type
  end

  def self.down
  	add_column :prd_balances, :condition_id, :integer
  	add_column :prd_balances, :condition_type, :string
  end
end
