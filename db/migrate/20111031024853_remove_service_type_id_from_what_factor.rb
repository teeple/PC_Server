class RemoveServiceTypeIdFromWhatFactor < ActiveRecord::Migration
  def self.up
    remove_column :what_factors, :service_type_id
  end

  def self.down
    add_column :what_factors, :service_type_id, :integer
  end
end
