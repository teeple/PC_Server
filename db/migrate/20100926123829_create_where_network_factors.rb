class CreateWhereNetworkFactors < ActiveRecord::Migration
  def self.up
    create_table :where_network_factors do |t|
      t.string :network
      t.integer :where_network_id

      t.timestamps
    end
  end

  def self.down
    drop_table :where_network_factors
  end
end
