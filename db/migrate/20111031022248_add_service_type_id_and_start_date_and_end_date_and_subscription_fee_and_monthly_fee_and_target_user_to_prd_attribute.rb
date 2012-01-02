class AddServiceTypeIdAndStartDateAndEndDateAndSubscriptionFeeAndMonthlyFeeAndTargetUserToPrdAttribute < ActiveRecord::Migration
  def self.up
    add_column :prd_attributes, :service_type_id, :integer
    add_column :prd_attributes, :start_date, :date
    add_column :prd_attributes, :end_date, :date
    add_column :prd_attributes, :subscription_fee, :integer
    add_column :prd_attributes, :monthly_fee, :integer
    add_column :prd_attributes, :target_user, :string
  end

  def self.down
    remove_column :prd_attributes, :target_user
    remove_column :prd_attributes, :monthly_fee
    remove_column :prd_attributes, :subscription_fee
    remove_column :prd_attributes, :end_date
    remove_column :prd_attributes, :start_date
    remove_column :prd_attributes, :service_type_id
  end
end
