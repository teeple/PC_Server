class RemoveTargetFromWhatFactor < ActiveRecord::Migration
  def self.up
    remove_column :what_factors, :target
  end

  def self.down
    add_column :what_factors, :target, :string
  end
end
