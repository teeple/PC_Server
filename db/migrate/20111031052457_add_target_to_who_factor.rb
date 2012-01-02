class AddTargetToWhoFactor < ActiveRecord::Migration
  def self.up
    add_column :who_factors, :target, :integer
  end

  def self.down
    remove_column :who_factors, :target
  end
end
