class CreateCcbsPackagedProducts < ActiveRecord::Migration
  def self.up
    create_table :ccbs_packaged_products do |t|
      t.string :code
      t.string :name
      t.string :start_date
      t.string :end_date
      t.string :product_type
      t.string :status
      t.date :crtdt
      t.text :package_product_list

      t.timestamps
    end
  end

  def self.down
    drop_table :ccbs_packaged_products
  end
end
