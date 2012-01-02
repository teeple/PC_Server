class ChangeColumnsInFactors < ActiveRecord::Migration
  def self.up
  	add_column :what_factors, :what_urlgroup_id, :integer
  	add_column :what_factors, :what_qo_id, :integer
	add_column :what_urlgroup_factors, :what_urlgroup_id, :integer
  end

  def self.down
  	remove_column :what_factors, :what_urlgroup_id
  	remove_column :what_factors, :what_qo_id
	remove_column :what_urlgroup_factors, :what_urlgroup_id 
  end
end
