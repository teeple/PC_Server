class ChangeColumnsInPrdAdditionalServices < ActiveRecord::Migration
  def self.up
  	remove_column :prd_additional_services, :action_id
  	remove_column :prd_additional_services, :action_type
	add_column :prd_additional_services, :rate, :float 
	add_column :prd_additional_services, :currency, :float 
  end

  def self.down
  	add_column :prd_additional_services, :action_id, :integer 
  	add_column :prd_additional_services, :action_type, :string
	remove_column :prd_additional_services, :rate
	remove_column :prd_additional_services, :currency
  end
end
