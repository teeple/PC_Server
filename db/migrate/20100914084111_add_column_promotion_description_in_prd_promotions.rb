class AddColumnPromotionDescriptionInPrdPromotions < ActiveRecord::Migration
  def self.up
  	add_column :prd_promotions, :description, :string
  end

  def self.down
  	remove_column :prd_promotions, :description
  end
end
