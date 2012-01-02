class AddServiceTypeAndTargetToWhenFactor < ActiveRecord::Migration
  def self.up
    add_column :when_factors, :service_type, :int
    add_column :when_factors, :target, :string
  end

  def self.down
    remove_column :when_factors, :target
    remove_column :when_factors, :service_type
  end
end
