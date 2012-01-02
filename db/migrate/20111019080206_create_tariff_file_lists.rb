class CreateTariffFileLists < ActiveRecord::Migration
  def self.up
    create_table :tariff_file_lists do |t|
      t.string :file_name

      t.timestamps
    end
  end

  def self.down
    drop_table :tariff_file_lists
  end
end
