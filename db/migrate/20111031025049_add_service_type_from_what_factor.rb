class AddServiceTypeFromWhatFactor < ActiveRecord::Migration
  def self.up
    add_column :what_factors, :service_type, :integer
  end

  def self.down
    remove_column :what_factors, :service_type
  end
end
