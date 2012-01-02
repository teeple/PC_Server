class AddTariffFileListIdToActionCustomFactor < ActiveRecord::Migration
  def self.up
    add_column :action_custom_factors, :tariff_file_list_id, :integer
  end

  def self.down
    remove_column :action_custom_factors, :tariff_file_list_id
  end
end
