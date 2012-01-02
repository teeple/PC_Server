class ChangeColumnTypesInPrdAttributes < ActiveRecord::Migration
  def self.up
    rename_column :prd_attributes, :target_user_id, :target_user
    change_table :prd_attributes do |t|
        t.change :target_user, :string
    end
  end

  def self.down
    rename_column :prd_attributes, :target_user, :target_user_id
    change table :prd_attributes do |t|
        t.change :target_user, :integer
    end
  end
end
