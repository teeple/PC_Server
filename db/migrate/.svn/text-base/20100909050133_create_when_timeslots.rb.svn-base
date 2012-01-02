class CreateWhenTimeslots < ActiveRecord::Migration
  def self.up
    create_table :when_timeslots do |t|
      t.string :subfctr_name
      t.string :description
      t.string :start_time
      t.string :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :when_timeslots
  end
end
