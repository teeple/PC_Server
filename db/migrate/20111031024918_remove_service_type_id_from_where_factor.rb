class RemoveServiceTypeIdFromWhereFactor < ActiveRecord::Migration
  def self.up
    remove_column :where_factors, :service_type_id
  end

  def self.down
    add_column :where_factors, :service_type_id, :integer
  end
end
