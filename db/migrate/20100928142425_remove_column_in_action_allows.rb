class RemoveColumnInActionAllows < ActiveRecord::Migration
  def self.up
  	remove_column :action_allows, :currency
  	remove_column :action_allows, :unitgive
  end

  def self.down
  	add_column :action_allows, :currency, :integer 
  	add_column :action_allows, :unitgive, :integer 
  end
end
