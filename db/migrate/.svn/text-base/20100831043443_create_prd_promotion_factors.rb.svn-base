class CreatePrdPromotionFactors < ActiveRecord::Migration
  def self.up
    create_table :prd_promotion_factors do |t|
      t.string :name
      t.string :operation
      t.string :value
      t.integer :prd_promotion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_promotion_factors
  end
end
