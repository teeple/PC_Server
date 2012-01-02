class CreateTariffLists < ActiveRecord::Migration
  def self.up
    create_table :tariff_lists do |t|
      t.number :prefix_country
      t.string :prefix_region
      t.float :d_unit
      t.float :d_tariff
      t.float :n_unit
      t.float :n_tariff
      t.integer :tariff_file_list_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tariff_lists
  end
end
