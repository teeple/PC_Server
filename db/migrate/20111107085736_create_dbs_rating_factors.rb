class CreateDbsRatingFactors < ActiveRecord::Migration
  def self.up
    create_table :dbs_rating_factors do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :dbs_rating_factors
  end
end
