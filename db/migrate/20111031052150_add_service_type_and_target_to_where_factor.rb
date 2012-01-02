class AddServiceTypeAndTargetToWhereFactor < ActiveRecord::Migration
  def self.up
    add_column :where_factors, :service_type, :int
    add_column :where_factors, :target, :string
  end

  def self.down
    remove_column :where_factors, :target
    remove_column :where_factors, :service_type
  end
end
