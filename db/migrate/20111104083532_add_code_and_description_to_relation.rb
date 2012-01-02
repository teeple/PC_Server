class AddCodeAndDescriptionToRelation < ActiveRecord::Migration
  def self.up
    add_column :relations, :code, :string
    add_column :relations, :description, :string
  end

  def self.down
    remove_column :relations, :description
    remove_column :relations, :code
  end
end
