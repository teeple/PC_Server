class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :userId
      t.string :user_name
      t.integer :user_class
      t.integer :user_role
      t.string :phone
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
