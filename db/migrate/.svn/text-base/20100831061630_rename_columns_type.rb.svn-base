class RenameColumnsType < ActiveRecord::Migration
  def self.up
  	rename_column :additional_services, :type, :vas_type
  	rename_column :prd_additional_services, :type, :vas_type
	rename_column :prd_attributes, :type, :prd_type 
  end

  def self.down
  	rename_column :additional_services, :vas_type, :type
  	rename_column :prd_additional_services, :vas_type, :type
	rename_column :prd_attributes, :prd_type, :type 
  end
end
