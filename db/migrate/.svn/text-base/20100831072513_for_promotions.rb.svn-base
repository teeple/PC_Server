class ForPromotions < ActiveRecord::Migration
  def self.up
  	remove_column :promotions, :factor_name
  	remove_column :promotions, :factor_type
  	remove_column :promotions, :is_required
	add_column :promotion_factors, :cond_or_result, :string 
	add_column :promotion_factors, :is_required, :string
  end

  def self.down
   	add_column :promotions, :factor_name, :string 
  	add_column :promotions, :factor_type, :string 
  	add_column :promotions, :is_required, :string
	remove_column :promotion_factors, :cond_or_result
	remove_column :promotion_factors, :is_required 
  end
end
