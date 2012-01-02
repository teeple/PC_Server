class AddPrdAttributeIdToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :prd_attribute_id, :integer
  end

  def self.down
    remove_column :relations, :prd_attribute_id
  end
end
