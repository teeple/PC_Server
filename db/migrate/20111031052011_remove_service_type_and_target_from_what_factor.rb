class RemoveServiceTypeAndTargetFromWhatFactor < ActiveRecord::Migration
  def self.up
    remove_column :what_factors, :service_type
    remove_column :what_factors, :target
  end

  def self.down
    add_column :what_factors, :target, :string
    add_column :what_factors, :service_type, :int
  end
end
