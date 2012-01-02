class AddSerivceTypeIdAndTargetAndDefaultToWhoFactors < ActiveRecord::Migration
  def self.up
    add_column :who_factors, :service_type_id, :integer
    add_column :who_factors, :target, :string
    add_column :who_factors, :default, :string
  end

  def self.down
    remove_column :who_factors, :default
    remove_column :who_factors, :target
    remove_column :who_factors, :service_type_id
  end
end
