class AddColumnProductIdInPrdPromotions < ActiveRecord::Migration
  def self.up
  	add_column :prd_promotions, :product_id, :integer
  end

  def self.down
  	remove_column :prd_promotions, :product_id
  end
end
