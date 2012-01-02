class CreateWhereCountryFactors < ActiveRecord::Migration
  def self.up
    create_table :where_country_factors do |t|
      t.integer :code_factor_id
      t.integer :where_country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :where_country_factors
  end
end
