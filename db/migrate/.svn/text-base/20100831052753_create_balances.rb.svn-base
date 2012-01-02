class CreateBalances < ActiveRecord::Migration
  def self.up
    create_table :balances do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :canbe_promotional

      t.timestamps
    end
  end

  def self.down
    drop_table :balances
  end
end
