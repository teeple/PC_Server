class AddServiceTypeAndProductCodeAndProductNameAndDescriptionAndBillingTypeAndStartDateAndEndDateAndProductTypeAndStatusAndDeviceListAndCrtdtToCrmProduct < ActiveRecord::Migration
  def self.up
    add_column :crm_products, :service_type, :string
    add_column :crm_products, :product_code, :string
    add_column :crm_products, :product_name, :string
    add_column :crm_products, :description, :string
    add_column :crm_products, :billing_type, :string
    add_column :crm_products, :start_date, :string
    add_column :crm_products, :end_date, :string
    add_column :crm_products, :product_type, :string
    add_column :crm_products, :status, :string
    add_column :crm_products, :device_list, :string
    add_column :crm_products, :crtdt, :string
  end

  def self.down
    remove_column :crm_products, :crtdt
    remove_column :crm_products, :device_list
    remove_column :crm_products, :status
    remove_column :crm_products, :product_type
    remove_column :crm_products, :end_date
    remove_column :crm_products, :start_date
    remove_column :crm_products, :billing_type
    remove_column :crm_products, :description
    remove_column :crm_products, :product_name
    remove_column :crm_products, :product_code
    remove_column :crm_products, :service_type
  end
end
