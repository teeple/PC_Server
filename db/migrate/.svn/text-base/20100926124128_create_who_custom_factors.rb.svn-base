class CreateWhoCustomFactors < ActiveRecord::Migration
  def self.up
    create_table :who_custom_factors do |t|
      t.string :name
      t.string :value
      t.string :operation
      t.integer :who_custom_id

      t.timestamps
    end
  end

  def self.down
    drop_table :who_custom_factors
  end
end
