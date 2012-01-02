class RemoveServiceTypeAndTargetFromWhenFactor < ActiveRecord::Migration
  def self.up
    remove_column :when_factors, :service_type
    remove_column :when_factors, :target
  end

  def self.down
    add_column :when_factors, :target, :string
    add_column :when_factors, :service_type, :int
  end
end
