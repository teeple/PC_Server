class AddDescirptionColumnInConditionTables < ActiveRecord::Migration
  def self.up
  	add_column :when_factors, :description, :string
	add_column :where_factors, :description, :string
	add_column :who_factors, :description, :string
  end

  def self.down
  	remove_column :when_factors, :description
	remove_column :where_factors, :description
	remove_column :who_factors, :description
  end
end
