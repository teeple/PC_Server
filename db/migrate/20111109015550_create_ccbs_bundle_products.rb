class CreateCcbsBundleProducts < ActiveRecord::Migration
  def self.up
    create_table :ccbs_bundle_products do |t|
      t.string :code
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :product_type
      t.string :status
      t.string :crtdt
      t.text :packaged_product_list

      t.timestamps
    end
  end

  def self.down
    drop_table :ccbs_bundle_products
  end
end
