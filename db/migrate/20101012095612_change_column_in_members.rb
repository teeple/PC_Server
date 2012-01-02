class ChangeColumnInMembers < ActiveRecord::Migration
  def self.up
  	remove_column :members, :hased_password
  	remove_column :members, :userId
	add_column :members, :hashed_password, :string
	add_column :members, :user_id, :string
  end

  def self.down	
  	add_column :members, :hased_password, :string
  	add_column :members, :userId, :string
	remove_column :members, :hashed_password
	remove_column :members, :user_id
  end
end
