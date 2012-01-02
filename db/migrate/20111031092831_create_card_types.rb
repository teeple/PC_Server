class CreateCardTypes < ActiveRecord::Migration
  def self.up
    create_table :card_types do |t|
      t.string :price_model
      t.string :price_model_nm
      t.float :price
      t.float :real_price
      t.string :svc_type
      t.float :ext_days
      t.date :crtdt
      t.string :crt_user
      t.date :updtdt
      t.string :updt_user
      t.string :pgm_id
      t.string :sale_item
      t.string :recharge_item

      t.timestamps
    end
  end

  def self.down
    drop_table :card_types
  end
end
