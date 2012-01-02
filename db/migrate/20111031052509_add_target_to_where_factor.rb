class AddTargetToWhereFactor < ActiveRecord::Migration
  def self.up
    add_column :where_factors, :target, :integer
  end

  def self.down
    remove_column :where_factors, :target
  end
end
