class AddRelationIdToSubRelation < ActiveRecord::Migration
  def self.up
    add_column :sub_relations, :relation_id, :integer
  end

  def self.down
    remove_column :sub_relations, :relation_id
  end
end
