class CreateWhenDurationFactors < ActiveRecord::Migration
  def self.up
    create_table :when_duration_factors do |t|
      t.string :start_date
      t.string :end_date
      t.integer :when_duration_id

      t.timestamps
    end
  end

  def self.down
    drop_table :when_duration_factors
  end
end
