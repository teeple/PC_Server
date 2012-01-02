class CreateWhoPrefixFactors < ActiveRecord::Migration
  def self.up
    create_table :who_prefix_factors do |t|
      t.string :prefix
      t.integer :who_prefix_id

      t.timestamps
    end
  end

  def self.down
    drop_table :who_prefix_factors
  end
end
