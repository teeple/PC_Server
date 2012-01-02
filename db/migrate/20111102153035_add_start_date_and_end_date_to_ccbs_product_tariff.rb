class AddStartDateAndEndDateToCcbsProductTariff < ActiveRecord::Migration
  def self.up
    add_column :ccbs_product_tariffs, :start_date, :string
    add_column :ccbs_product_tariffs, :end_date, :string
  end

  def self.down
    remove_column :ccbs_product_tariffs, :end_date
    remove_column :ccbs_product_tariffs, :start_date
  end
end
