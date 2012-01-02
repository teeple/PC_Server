class ChangeCounryCodeInTables < ActiveRecord::Migration
  def self.up
  	remove_column :who_country_factors, :code_factor_id
  	remove_column :where_country_factors, :code_factor_id
  	add_column :who_country_factors, :country_code, :string
  	add_column :where_country_factors, :country_code, :string
  end

  def self.down
  	add_column :who_country_factors, :code_factor_id, :integer
  	add_column :where_country_factors, :code_factor_id, :integer
  	remove_column :who_country_factors, :country_code
  	remove_column :where_country_factors, :country_code
  end
end
