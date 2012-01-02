class RemoveProductIdFromRelation < ActiveRecord::Migration
  def self.up
    remove_column :relations, :product_id
  end

  def self.down
    add_column :relations, :product_id, :integer
  end
end
