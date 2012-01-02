class AddColumDayTypeInWhenDays < ActiveRecord::Migration
  def self.up
  	add_column :when_days, :day_type, :string
  end

  def self.down
  	remove_column :when_days, :day_type
  end
end
