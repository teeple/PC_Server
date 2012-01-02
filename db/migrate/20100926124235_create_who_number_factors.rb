class CreateWhoNumberFactors < ActiveRecord::Migration
  def self.up
    create_table :who_number_factors do |t|
      t.string :number
      t.integer :who_number_id

      t.timestamps
    end
  end

  def self.down
    drop_table :who_number_factors
  end
end
