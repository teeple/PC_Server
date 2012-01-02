class AddServiceTypeFromWhenFactor < ActiveRecord::Migration
  def self.up
    add_column :when_factors, :service_type, :integer
  end

  def self.down
    remove_column :when_factors, :service_type
  end
end
