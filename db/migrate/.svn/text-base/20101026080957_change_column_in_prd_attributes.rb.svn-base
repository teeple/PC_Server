class ChangeColumnInPrdAttributes < ActiveRecord::Migration
  def self.up
  	remove_column 	:prd_attributes, :ref_product_id
	add_column 		:prd_attributes, :ref_products, 	:string
  end

  def self.down
  	add_column 		:prd_attributes, :ref_product_id, 	:string
	remove_column 	:prd_attributes, :ref_products
  end
end
