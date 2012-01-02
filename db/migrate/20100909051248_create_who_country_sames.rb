class CreateWhoCountrySames < ActiveRecord::Migration
  def self.up
    create_table :who_country_sames do |t|
      t.string :subfctr_name
      t.string :description
      t.string :is_same_country
      t.string :is_same_zone

      t.timestamps
    end
  end

  def self.down
    drop_table :who_country_sames
  end
end
