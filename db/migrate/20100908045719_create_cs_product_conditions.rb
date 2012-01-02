class CreateCsProductConditions < ActiveRecord::Migration
  def self.up
    create_table :cs_product_conditions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :cs_product_conditions
  end
end
