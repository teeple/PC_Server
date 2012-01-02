class CreateWhereNetworks < ActiveRecord::Migration
  def self.up
    create_table :where_networks do |t|
      t.string :subfctr_name
      t.string :description
      t.string :network

      t.timestamps
    end
  end

  def self.down
    drop_table :where_networks
  end
end
