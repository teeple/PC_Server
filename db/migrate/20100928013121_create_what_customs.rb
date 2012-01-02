class CreateWhatCustoms < ActiveRecord::Migration
  def self.up
    create_table :what_customs do |t|
      t.string :subfctr_name
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :what_customs
  end
end
