class ChangeColumnNamesToPrdAttributes < ActiveRecord::Migration
  def self.up
    rename_column :prd_attributes, :bill_type, :bill_type_id
    rename_column :prd_attributes, :status, :status_id
    rename_column :prd_attributes, :service_type, :service_type_id
    rename_column :prd_attributes, :target_user, :target_user_id
  end

  def self.down
    rename_column :prd_attributes, :bill_type_id, :bill_type
    rename_column :prd_attributes, :status_id, :status
    rename_column :prd_attributes, :service_type_id, :service_type
    rename_column :prd_attributes, :target_user_id, :target_user
  end
end
