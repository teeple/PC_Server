class CreateWhenDayFactors < ActiveRecord::Migration
  def self.up
    create_table :when_day_factors do |t|
      t.string :day
      t.string :day_type
      t.integer :when_day_id

      t.timestamps
    end
  end

  def self.down
    drop_table :when_day_factors
  end
end
