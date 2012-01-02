class AddSerivceTypeIdAndTargetAndDefaultToWhenFactors < ActiveRecord::Migration
  def self.up
    add_column :when_factors, :service_type_id, :integer
    add_column :when_factors, :target, :string
    add_column :when_factors, :default, :string
  end

  def self.down
    remove_column :when_factors, :default
    remove_column :when_factors, :target
    remove_column :when_factors, :service_type_id
  end
end
