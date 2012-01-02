class RemoveTargetFromWhereFactor < ActiveRecord::Migration
  def self.up
    remove_column :where_factors, :target
  end

  def self.down
    add_column :where_factors, :target, :string
  end
end
