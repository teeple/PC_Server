class AddRateAndCurrencyInAddtionalServices < ActiveRecord::Migration
  def self.up
  	add_column :additional_services, :rate, :integer
  	add_column :additional_services, :currency_factor_id, :integer
  end

  def self.down
  	remove_column :additional_services, :rate
  	remove_column :additional_services, :currency_factor_id
  end
end
