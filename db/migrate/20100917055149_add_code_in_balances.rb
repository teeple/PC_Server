class AddCodeInBalances < ActiveRecord::Migration
  def self.up
  	add_column :balances, :code, :string 
  end

  def self.down
  	remove_column :balances, :code
  end
end
