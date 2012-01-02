class RemoveTargetFromWhoFactor < ActiveRecord::Migration
  def self.up
    remove_column :who_factors, :target
  end

  def self.down
    add_column :who_factors, :target, :string
  end
end
