class CreatePrdBalances < ActiveRecord::Migration
  def self.up
    create_table :prd_balances do |t|
      t.integer :parent_id
      t.integer :condition_id
      t.string :condition_type
      t.integer :balance_id
      t.integer :priority
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_balances
  end
end
