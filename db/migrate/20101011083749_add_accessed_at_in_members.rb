class AddAccessedAtInMembers < ActiveRecord::Migration
  def self.up
  	add_column :members, :accessed_at, :datetime
  end

  def self.down
  	remove_column :members, :accessed_at
  end
end
