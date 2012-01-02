class CreateWhatQos < ActiveRecord::Migration
  def self.up
    create_table :what_qos do |t|
      t.string :subfctr_name
      t.string :description
      t.integer :level1
      t.integer :level2
      t.integer :level3
      t.integer :level4
      t.integer :level5

      t.timestamps
    end
  end

  def self.down
    drop_table :what_qos
  end
end
