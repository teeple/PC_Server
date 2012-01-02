class AddBalanceIdToPrdThreshold < ActiveRecord::Migration
  def self.up
    add_column :prd_thresholds, :balance_id, :integer
  end

  def self.down
    remove_column :prd_thresholds, :balance_id
  end
end
