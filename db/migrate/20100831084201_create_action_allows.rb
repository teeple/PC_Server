class CreateActionAllows < ActiveRecord::Migration
  def self.up
    create_table :action_allows do |t|
      t.string :subfctr_name
      t.string :give
      t.string :currency
      t.integer :unitgive
      t.string :unit

      t.timestamps
    end
  end

  def self.down
    drop_table :action_allows
  end
end
