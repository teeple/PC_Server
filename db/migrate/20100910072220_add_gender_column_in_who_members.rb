class AddGenderColumnInWhoMembers < ActiveRecord::Migration
  def self.up
  	add_column :who_members, :gender, :string
  end

  def self.down
  	remove_column :who_members, :gender
  end
end
