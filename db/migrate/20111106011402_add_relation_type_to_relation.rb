class AddRelationTypeToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :relation_type, :string
  end

  def self.down
    remove_column :relations, :relation_type
  end
end
