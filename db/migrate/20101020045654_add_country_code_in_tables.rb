class AddCountryCodeInTables < ActiveRecord::Migration
  def self.up
  	add_column :who_country_factors, :country_code, :string
  	add_column :where_country_factors, :country_code, :string
  end

  def self.down
  	remove_column :who_country_factors, :country_code
  	remove_column :where_country_factors, :country_code
  end
end
