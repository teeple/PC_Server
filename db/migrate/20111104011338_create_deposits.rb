class CreateDeposits < ActiveRecord::Migration
  def self.up
    create_table :deposits do |t|
      t.integer :product_id
      t.integer :balance_id
      t.integer :deposit

      t.timestamps
    end
  end

  def self.down
    drop_table :deposits
  end
end
