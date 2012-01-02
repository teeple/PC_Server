class AddRolloverToPrdAttributes < ActiveRecord::Migration
  def self.up
    add_column :prd_attributes, :rollover, :integer
  end

  def self.down
    remove_column :prd_attributes, :rollover
  end
end
