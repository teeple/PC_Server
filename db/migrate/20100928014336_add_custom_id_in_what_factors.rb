class AddCustomIdInWhatFactors < ActiveRecord::Migration
  def self.up
  	add_column :what_factors, :what_custom_id, :integer 
  end

  def self.down
  	remove_column :what_factors, :what_custom_id
  end
end
