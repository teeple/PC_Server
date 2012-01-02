class AddResetCycleToBalances < ActiveRecord::Migration
  def self.up
    add_column :balances, :reset_cycle, :integer
  end

  def self.down
    remove_column :balances, :reset_cycle
  end
end
