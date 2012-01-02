class AddContentToTariffFileList < ActiveRecord::Migration
  def self.up
    add_column :tariff_file_lists, :content, :text
  end

  def self.down
    remove_column :tariff_file_lists, :content
  end
end
