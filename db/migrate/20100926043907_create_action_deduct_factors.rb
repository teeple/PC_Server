class CreateActionDeductFactors < ActiveRecord::Migration
  def self.up
    create_table :action_deduct_factors do |t|
      t.integer :upto_start
      t.integer :upto_end
      t.string :upto_type
      t.integer :tariff_id
      t.integer :action_deduct_id

      t.timestamps
    end
  end

  def self.down
    drop_table :action_deduct_factors
  end
end
