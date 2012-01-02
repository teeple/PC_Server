class AddSerivceTypeIdAndTargetAndDefaultToWhereFactors < ActiveRecord::Migration
  def self.up
    add_column :where_factors, :service_type_id, :integer
    add_column :where_factors, :target, :string
    add_column :where_factors, :default, :string
  end

  def self.down
    remove_column :where_factors, :default
    remove_column :where_factors, :target
    remove_column :where_factors, :service_type_id
  end
end
