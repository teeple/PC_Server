class CreatePromotionFactors < ActiveRecord::Migration
  def self.up
    create_table :promotion_factors do |t|
      t.string :name
      t.integer :promotion_id

      t.timestamps
    end
  end

  def self.down
    drop_table :promotion_factors
  end
end
