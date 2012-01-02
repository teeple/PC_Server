class CreateCcbsProducts < ActiveRecord::Migration
  def self.up
    create_table :ccbs_products do |t|
      t.string :service_type
      t.string :product_code
      t.string :product_name
      t.string :description
      t.string :billing_type
      t.string :start_date
      t.string :end_date
      t.string :product_type
      t.string :status
      t.string :device_list
      t.date :crtdt
      t.text :condition_list
      t.text :item_list

      t.timestamps
    end
  end

  def self.down
    drop_table :ccbs_products
  end
end
