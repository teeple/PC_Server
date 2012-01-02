class ChangeColumnInPrdPromotionFactors < ActiveRecord::Migration
  def self.up
  	remove_column :prd_promotion_factors, :name
	add_column :prd_promotion_factors, :promotion_factor_id, :integer 
   	remove_column :prd_promotion_factors, :prd_promotion_id
	add_column :prd_promotion_factors, :prd_promotion_rule_id, :integer 
  end

  def self.down
  	add_column :prd_promotion_factors, :name,	:string 
	remove_column :prd_promotion_factors, :promotion_factor_id
  	add_column :prd_promotion_factors, :prd_promotion_id, :integer 
	remove_column :prd_promotion_factors, :prd_promotion_rule_id
  end

end
