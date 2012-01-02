class ChangeColumnsInPrdAttributeAndProducts < ActiveRecord::Migration
  def self.up
  	remove_column 	:prd_attributes, :product_id
	add_column 		:prd_attributes, :ref_product_id, :string
	add_column		:products, :prd_attribute_id, :integer
	add_column		:prd_attribute_devices, :product_id, :integer 
  end

  def self.down
  	add_column		:prd_attributes, :product_id, :integer
	remove_column	:prd_attributes, :ref_product_id
	remove_column	:products, :prd_attribute_id
	remove_column	:prd_attribute_devices, :product_id
  end
end
