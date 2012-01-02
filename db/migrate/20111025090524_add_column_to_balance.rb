class AddColumnToBalance < ActiveRecord::Migration
  def self.up
    add_column :balances, :type, :string
    add_column :balances, :free_charged, :string
    add_column :balances, :reset_cycle, :string
    add_column :balances, :expire_date, :time
  end

  def self.down
    remove_column :balances, :expire_date
    remove_column :balances, :reset_cycle
    remove_column :balances, :free_charged
    remove_column :balances, :type
  end
end
