class ChageColumnInPrdPromotionFactors < ActiveRecord::Migration
  def self.up
	add_column :prd_promotion_factors, :name, :string
  end

  def self.down
	remove_column :prd_promotion_factors, :name
  end
end
