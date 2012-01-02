class CreateCodeFactors < ActiveRecord::Migration
  def self.up
    create_table :code_factors do |t|
      t.string :name
      t.integer :code_id

      t.timestamps
    end
  end

  def self.down
    drop_table :code_factors
  end
end
