class AddProductIdColumnInPrdAdditionServices < ActiveRecord::Migration
  def self.up
  	add_column :prd_additional_services, :product_id, :integer
  end

  def self.down
  	remove_column :prd_additional_services, :product_id
  end
end
