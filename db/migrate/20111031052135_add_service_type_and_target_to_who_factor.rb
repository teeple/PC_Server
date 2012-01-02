class AddServiceTypeAndTargetToWhoFactor < ActiveRecord::Migration
  def self.up
    add_column :who_factors, :service_type, :int
    add_column :who_factors, :target, :string
  end

  def self.down
    remove_column :who_factors, :target
    remove_column :who_factors, :service_type
  end
end
