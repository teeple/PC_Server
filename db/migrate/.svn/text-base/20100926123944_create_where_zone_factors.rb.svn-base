class CreateWhereZoneFactors < ActiveRecord::Migration
  def self.up
    create_table :where_zone_factors do |t|
      t.string :title
      t.string :lat
      t.string :lng
      t.integer :where_zone_id

      t.timestamps
    end
  end

  def self.down
    drop_table :where_zone_factors
  end
end
