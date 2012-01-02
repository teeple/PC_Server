class ChangeHolidayColumnInWhenWeeks < ActiveRecord::Migration
  def self.up
  	remove_column :when_weeks, :holiday
  	add_column :when_weeks, :is_holiday, :string
  end

  def self.down
  	add_column :when_weeks, :holiday, :integer
  	remove_column :when_weeks, :is_holiday
  end
end
