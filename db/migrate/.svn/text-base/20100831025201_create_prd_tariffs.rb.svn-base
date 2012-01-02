class CreatePrdTariffs < ActiveRecord::Migration
  def self.up
    create_table :prd_tariffs do |t|
      t.integer :parent_id
      t.integer :condition_id
      t.string :condition_type
      t.integer :action_id
      t.string :action_type
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_tariffs
  end
end
