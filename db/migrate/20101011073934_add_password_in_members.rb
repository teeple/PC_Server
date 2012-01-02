class AddPasswordInMembers < ActiveRecord::Migration
  def self.up
  	add_column :members, :hased_password, :string
	add_column :members, :salt, :string
  end

  def self.down
  	remove_column :members, :hased_password
  	remove_column :members, :salt
  end
end
