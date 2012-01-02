class CreatePrdBalanceConditions < ActiveRecord::Migration
  def self.up
    create_table :prd_balance_conditions do |t|
      t.integer :parent_id
      t.integer :condition_id
      t.string :condition_type
      t.integer :prd_balance_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_balance_conditions
  end
end
