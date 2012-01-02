class CreateWhoNumbers < ActiveRecord::Migration
  def self.up
    create_table :who_numbers do |t|
      t.string :subfctr_name
      t.string :description
      t.string :number

      t.timestamps
    end
  end

  def self.down
    drop_table :who_numbers
  end
end
