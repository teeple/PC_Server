class ChangeNameInRelations < ActiveRecord::Migration
  def self.up
    rename_column :relations, :relation_type, :relation_type_id
  end

  def self.down
    rename_column :relations, :relation_type_id, :relation_type
  end
end
