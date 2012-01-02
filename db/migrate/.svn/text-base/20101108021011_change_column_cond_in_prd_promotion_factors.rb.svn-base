class ChangeColumnCondInPrdPromotionFactors < ActiveRecord::Migration
  def self.up
  	remove_column 	:prd_promotion_factors, :promotion_factor_id
	add_column 		:prd_promotion_factors, :cond_or_result, :string
  end

  def self.down
  	add_column 		:prd_promotion_factors, :promotion_factor_id, :integer
	remove_column 	:prd_promotion_factors, :cond_or_result
  end
end
