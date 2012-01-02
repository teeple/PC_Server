class AddServiceTypeFromWhoFactor < ActiveRecord::Migration
  def self.up
    add_column :who_factors, :service_type, :integer
  end

  def self.down
    remove_column :who_factors, :service_type
  end
end
