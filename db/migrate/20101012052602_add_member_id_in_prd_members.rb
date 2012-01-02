class AddMemberIdInPrdMembers < ActiveRecord::Migration
  def self.up
  	add_column :prd_members, :member_id, :integer 
  end

  def self.down
  	remove_column :prd_members, :member_id
  end
end
