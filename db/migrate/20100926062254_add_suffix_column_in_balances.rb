class AddSuffixColumnInBalances < ActiveRecord::Migration
  def self.up
  	add_column :balances, :suffix, :integer 
  end

  def self.down
  	remove_column :balances, :suffix
  end
end
