class CreateWhenWeeks < ActiveRecord::Migration
  def self.up
    create_table :when_weeks do |t|
      t.string :subfctr_name
      t.string :description
      t.integer :sun
      t.integer :mon
      t.integer :tue
      t.integer :wed
      t.integer :thu
      t.integer :fri
      t.integer :sat

      t.timestamps
    end
  end

  def self.down
    drop_table :when_weeks
  end
end
