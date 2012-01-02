class CreateWhereCountries < ActiveRecord::Migration
  def self.up
    create_table :where_countries do |t|
      t.string :subfctr_name
      t.string :description
      t.text :country_inex

      t.timestamps
    end
  end

  def self.down
    drop_table :where_countries
  end
end
