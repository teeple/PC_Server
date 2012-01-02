class RemoveParentIdAndPrdAttributeIdFromRelation < ActiveRecord::Migration
  def self.up
    remove_column :relations, :parent_id
    remove_column :relations, :prd_attribute_id
  end

  def self.down
    add_column :relations, :prd_attribute_id, :integer
    add_column :relations, :parent_id, :integer
  end
end
