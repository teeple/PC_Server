class AddColumnInWhatFactors < ActiveRecord::Migration
  def self.up
  	add_column :what_factors, :code_factor_id, :integer
	add_column :what_factors, :rating_group, :integer
  end

  def self.down
	remove_column :what_factors, :code_factor_id
	remove_column :what_factors, :rating_group
  end
end
