class ChangeColumnInWhens < ActiveRecord::Migration
  def self.up
  	remove_column :when_days, :holiday
  	add_column :when_weeks, :holiday, :integer
  end

  def self.down
  	add_column :when_days, :holiday, :string
  	remove_column :when_weeks, :holiday
  end
end
