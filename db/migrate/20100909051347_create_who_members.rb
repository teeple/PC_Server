class CreateWhoMembers < ActiveRecord::Migration
  def self.up
    create_table :who_members do |t|
      t.string :subfctr_name
      t.string :description
      t.string :viceversa
      t.string :onoffnet
      t.string :memberof

      t.timestamps
    end
  end

  def self.down
    drop_table :who_members
  end
end
