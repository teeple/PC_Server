class ChangeColumnInBalances < ActiveRecord::Migration
  def self.up
  	remove_column :balances, :type
	add_column :balances, :balance_type, :string 
	add_column :balances, :scale, :integer 
  end

  def self.down
  	add_column :balances, :type, :string
	remove_column :balances, :balance_type
	remove_column :balances, :scale
  end
end
