class AddServiceTypeFromPrdAttribute < ActiveRecord::Migration
  def self.up
    add_column :prd_attributes, :service_type, :integer
  end

  def self.down
    remove_column :prd_attributes, :service_type
  end
end
