class CreateActionCustomFactors < ActiveRecord::Migration
  def self.up
    create_table :action_custom_factors do |t|
      t.string :name
      t.string :value
      t.string :operation
      t.integer :action_custom_id

      t.timestamps
    end
  end

  def self.down
    drop_table :action_custom_factors
  end
end
