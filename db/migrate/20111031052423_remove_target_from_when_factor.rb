class RemoveTargetFromWhenFactor < ActiveRecord::Migration
  def self.up
    remove_column :when_factors, :target
  end

  def self.down
    add_column :when_factors, :target, :string
  end
end
