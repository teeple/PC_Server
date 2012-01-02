class CreateTestTests < ActiveRecord::Migration
  def self.up
    create_table :test_tests do |t|
      t.string :fidl1
      t.integer :fld2

      t.timestamps
    end
  end

  def self.down
    drop_table :test_tests
  end
end
