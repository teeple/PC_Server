class RenameColumnActionToActionTypeInPromotions < ActiveRecord::Migration
  def self.up
  	rename_column :promotions, :action, :action_type
  end

  def self.down
  	rename_column :promotions, :action_type, :action
  end
end
