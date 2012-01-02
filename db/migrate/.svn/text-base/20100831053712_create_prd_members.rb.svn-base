class CreatePrdMembers < ActiveRecord::Migration
  def self.up
    create_table :prd_members do |t|
      t.string :user_id
      t.string :role
      t.string :hashed_password
      t.string :salt
      t.string :role
      t.string :status
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_members
  end
end
