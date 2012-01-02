class AddTargetToWhatFactor < ActiveRecord::Migration
  def self.up
    add_column :what_factors, :target, :integer
  end

  def self.down
    remove_column :what_factors, :target
  end
end
