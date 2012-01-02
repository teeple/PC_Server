class CreatePrdPromotionRules < ActiveRecord::Migration
  def self.up
    create_table :prd_promotion_rules do |t|
      t.integer :prd_promotion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_promotion_rules
  end
end
