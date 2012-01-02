class CreatePrdAdditionalServices < ActiveRecord::Migration
  def self.up
    create_table :prd_additional_services do |t|
      t.integer :additional_service_id
      t.string :type
      t.integer :action_id
      t.string :action_type

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_additional_services
  end
end
