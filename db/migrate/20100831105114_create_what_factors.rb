class CreateWhatFactors < ActiveRecord::Migration
  def self.up
    create_table :what_factors do |t|
      t.string :fctr_code
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :what_factors
  end
end
