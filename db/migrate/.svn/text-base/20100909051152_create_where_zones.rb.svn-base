class CreateWhereZones < ActiveRecord::Migration
  def self.up
    create_table :where_zones do |t|
      t.string :subfctr_name
      t.string :description
      t.string :title
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :where_zones
  end
end
