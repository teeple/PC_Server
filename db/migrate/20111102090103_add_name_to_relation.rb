class AddNameToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :name, :string
  end

  def self.down
    remove_column :relations, :name
  end
end
