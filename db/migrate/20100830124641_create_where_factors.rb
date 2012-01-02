class CreateWhereFactors < ActiveRecord::Migration
  def self.up
    create_table :where_factors do |t|
      t.string :fctr_code
      t.string :country_name
      t.string :zone_name
      t.string :network_name
      t.string :custom_name

      t.timestamps
    end
  end

  def self.down
    drop_table :where_factors
  end
end
