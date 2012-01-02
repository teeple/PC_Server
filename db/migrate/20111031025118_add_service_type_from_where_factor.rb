class AddServiceTypeFromWhereFactor < ActiveRecord::Migration
  def self.up
    add_column :where_factors, :service_type, :integer
  end

  def self.down
    remove_column :where_factors, :service_type
  end
end
