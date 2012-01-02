class AddItemCodeToCcbsProductTariff < ActiveRecord::Migration
  def self.up
    add_column :ccbs_product_tariffs, :item_code, :string
  end

  def self.down
    remove_column :ccbs_product_tariffs, :item_code
  end
end
