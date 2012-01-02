class CreateWhenDurations < ActiveRecord::Migration
  def self.up
    create_table :when_durations do |t|
      t.string :subfctr_name
      t.string :description
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end

  def self.down
    drop_table :when_durations
  end
end
