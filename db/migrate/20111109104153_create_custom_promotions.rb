class CreateCustomPromotions < ActiveRecord::Migration
  def self.up
    create_table :custom_promotions do |t|
      t.integer :service_code_id
      t.string :product_code
      t.string :promotion_service_id
      t.integer :priority
      t.string :promotion_category
      t.string :promotion_parameter
      t.string :package

      t.timestamps
    end
  end

  def self.down
    drop_table :custom_promotions
  end
end
