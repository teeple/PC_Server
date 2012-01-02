class AddColumnPrdConditions < ActiveRecord::Migration
  def self.up
  	add_column :prd_subscriptions, :condition_type, :string
  end

  def self.down
  	remove_column :prd_subscriptions, :condition_type
  end
end
