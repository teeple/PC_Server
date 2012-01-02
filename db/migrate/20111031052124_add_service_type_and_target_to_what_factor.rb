class AddServiceTypeAndTargetToWhatFactor < ActiveRecord::Migration
  def self.up
    add_column :what_factors, :service_type, :int
    add_column :what_factors, :target, :string
  end

  def self.down
    remove_column :what_factors, :target
    remove_column :what_factors, :service_type
  end
end
