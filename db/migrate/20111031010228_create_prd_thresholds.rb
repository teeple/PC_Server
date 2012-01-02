class CreatePrdThresholds < ActiveRecord::Migration
  def self.up
    create_table :prd_thresholds do |t|
      t.integer :parent_id
      t.integer :condition_id
      t.string :condition_type
      t.string :balance_id
      t.integer :action_id
      t.string :action_type
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_thresholds
  end
end
