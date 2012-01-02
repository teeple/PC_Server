class RemoveServiceTypeAndTargetFromWhoFactor < ActiveRecord::Migration
  def self.up
    remove_column :who_factors, :service_type
    remove_column :who_factors, :target
  end

  def self.down
    add_column :who_factors, :target, :string
    add_column :who_factors, :service_type, :int
  end
end
