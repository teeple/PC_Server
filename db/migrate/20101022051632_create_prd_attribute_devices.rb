class CreatePrdAttributeDevices < ActiveRecord::Migration
  def self.up
    create_table :prd_attribute_devices do |t|
      t.integer :code_factor_id
      t.integer :prd_attribute_id
      t.integer :lock_version

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_attribute_devices
  end
end
