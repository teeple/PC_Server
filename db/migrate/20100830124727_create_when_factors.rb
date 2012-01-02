class CreateWhenFactors < ActiveRecord::Migration
  def self.up
    create_table :when_factors do |t|
      t.string :fctr_code
      t.string :duration_name
      t.string :date_name
      t.string :timeslot_name
      t.string :custom_name
      t.string :day_name

      t.timestamps
    end
  end

  def self.down
    drop_table :when_factors
  end
end
