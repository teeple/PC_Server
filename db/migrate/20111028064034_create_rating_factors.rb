class CreateRatingFactors < ActiveRecord::Migration
  def self.up
    create_table :rating_factors do |t|
      t.integer :basic_product_id
      t.integer :packaged_product_id
      t.string :factor
      t.string :function

      t.timestamps
    end
  end

  def self.down
    drop_table :rating_factors
  end
end
