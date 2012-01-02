class RemoveServiceTypeIdFromPrdAttribute < ActiveRecord::Migration
  def self.up
    remove_column :prd_attributes, :service_type_id
  end

  def self.down
    add_column :prd_attributes, :service_type_id, :integer
  end
end
