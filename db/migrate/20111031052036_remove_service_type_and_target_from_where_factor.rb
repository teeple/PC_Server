class RemoveServiceTypeAndTargetFromWhereFactor < ActiveRecord::Migration
  def self.up
    remove_column :where_factors, :service_type
    remove_column :where_factors, :target
  end

  def self.down
    add_column :where_factors, :target, :string
    add_column :where_factors, :service_type, :int
  end
end
