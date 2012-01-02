class RemoveFromdtAndTodtFromCcbsProductTariff < ActiveRecord::Migration
  def self.up
    remove_column :ccbs_product_tariffs, :fromdt
    remove_column :ccbs_product_tariffs, :todt
  end

  def self.down
    add_column :ccbs_product_tariffs, :todt, :date
    add_column :ccbs_product_tariffs, :fromdt, :date
  end
end
