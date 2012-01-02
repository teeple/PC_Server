class RemoveResetCycleFromBalances < ActiveRecord::Migration
  def self.up
    remove_column :balances, :reset_cycle
  end

  def self.down
    add_column :balances, :reset_cycle, :string
  end
end
