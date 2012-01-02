class CreateCrmProducts < ActiveRecord::Migration
  def self.up
    create_table :crm_products do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :crm_products
  end
end
