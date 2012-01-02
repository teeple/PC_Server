class CreateCsProductVas < ActiveRecord::Migration
  def self.up
    create_table :cs_product_vas do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :cs_product_vas
  end
end
