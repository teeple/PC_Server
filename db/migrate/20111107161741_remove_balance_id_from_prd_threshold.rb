class RemoveBalanceIdFromPrdThreshold < ActiveRecord::Migration
  def self.up
    remove_column :prd_thresholds, :balance_id
  end

  def self.down
    add_column :prd_thresholds, :balance_id, :string
  end
end
