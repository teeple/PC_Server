class RemoveServiceTypeIdFromWhoFactor < ActiveRecord::Migration
  def self.up
    remove_column :who_factors, :service_type_id
  end

  def self.down
    add_column :who_factors, :service_type_id, :integer
  end
end
