class AddSerivceTypeIdAndTargetAndDefaultToWhatFactors < ActiveRecord::Migration
  def self.up
    add_column :what_factors, :service_type_id, :integer
    add_column :what_factors, :target, :string
    add_column :what_factors, :default, :string
  end

  def self.down
    remove_column :what_factors, :default
    remove_column :what_factors, :target
    remove_column :what_factors, :service_type_id
  end
end
