class CreateAdditionalServices < ActiveRecord::Migration
  def self.up
    create_table :additional_services do |t|
      t.string :name
      t.string :description
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :additional_services
  end
end
