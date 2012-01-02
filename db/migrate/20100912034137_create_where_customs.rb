class CreateWhereCustoms < ActiveRecord::Migration
  def self.up
    create_table :where_customs do |t|
      t.string :subfctr_name
      t.string :description
      t.string :name
      t.string :value
      t.string :operation

      t.timestamps
    end
  end

  def self.down
    drop_table :where_customs
  end
end
