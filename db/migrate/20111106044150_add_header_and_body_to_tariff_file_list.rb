class AddHeaderAndBodyToTariffFileList < ActiveRecord::Migration
  def self.up
    add_column :tariff_file_lists, :header, :string
    add_column :tariff_file_lists, :body, :text
  end

  def self.down
    remove_column :tariff_file_lists, :body
    remove_column :tariff_file_lists, :header
  end
end
