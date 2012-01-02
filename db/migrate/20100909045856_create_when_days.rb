class CreateWhenDays < ActiveRecord::Migration
  def self.up
    create_table :when_days do |t|
      t.string :subfctr_name
      t.string :description
      t.string :day

      t.timestamps
    end
  end

  def self.down
    drop_table :when_days
  end
end
