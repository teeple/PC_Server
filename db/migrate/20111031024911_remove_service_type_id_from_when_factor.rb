class RemoveServiceTypeIdFromWhenFactor < ActiveRecord::Migration
  def self.up
    remove_column :when_factors, :service_type_id
  end

  def self.down
    add_column :when_factors, :service_type_id, :integer
  end
end
