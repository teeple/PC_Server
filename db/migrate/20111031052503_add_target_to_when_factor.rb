class AddTargetToWhenFactor < ActiveRecord::Migration
  def self.up
    add_column :when_factors, :target, :integer
  end

  def self.down
    remove_column :when_factors, :target
  end
end
