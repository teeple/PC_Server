class CreateActionDiscounts < ActiveRecord::Migration
  def self.up
    create_table :action_discounts do |t|
      t.string :subfctr_name
      t.integer :upto
      t.integer :rate
      t.string :uptounit
      t.string :rateunit

      t.timestamps
    end
  end

  def self.down
    drop_table :action_discounts
  end
end
