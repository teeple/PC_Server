class CreateActionDeducts < ActiveRecord::Migration
  def self.up
    create_table :action_deducts do |t|
      t.string :subfctr_name
      t.string :disfactor
      t.string :unitrate
      t.integer :rate
      t.integer :upto
      t.integer :amount

      t.timestamps
    end
  end

  def self.down
    drop_table :action_deducts
  end
end
