class CreateCcbsProductTariffs < ActiveRecord::Migration
  def self.up
    create_table :ccbs_product_tariffs do |t|
      t.string :product_code
      t.string :itemcod
      t.date :fromdt
      t.date :todt
      t.string :method
      t.integer :add_unit
      t.float :unit_charge
      t.float :suspamt
      t.float :validity_term
      t.string :crt_user
      t.string :updt_user
      t.date :crtdt
      t.date :updtdt
      t.string :pgm_id
      t.float :min_unitcharge
      t.float :max_unitcharge

      t.timestamps
    end
  end

  def self.down
    drop_table :ccbs_product_tariffs
  end
end
