class ChangeColumnInActions < ActiveRecord::Migration
  def self.up
  	change_column :action_deduct_factors, :upto_type, :integer
  	change_column :action_allows, :unit, :integer
  	change_column :action_discounts, :uptounit, :integer
  	change_column :action_discounts, :rateunit, :integer
  end

  def self.down
  	raise ActiveRecord::IrreversibleMigration
  end
end
