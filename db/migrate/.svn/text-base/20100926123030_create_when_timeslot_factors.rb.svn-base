class CreateWhenTimeslotFactors < ActiveRecord::Migration
  def self.up
    create_table :when_timeslot_factors do |t|
      t.string :start_time
      t.string :end_time
      t.integer :when_timeslot_id

      t.timestamps
    end
  end

  def self.down
    drop_table :when_timeslot_factors
  end
end
