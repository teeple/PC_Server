class AddDescriptionInActionCustoms < ActiveRecord::Migration
  def self.up
  	add_column :action_customs, :description, :string 
  end

  def self.down
  	remove_column :action_customs, :description
  end
end
