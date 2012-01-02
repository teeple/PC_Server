class CreateWhoCountryFactors < ActiveRecord::Migration
  def self.up
    create_table :who_country_factors do |t|
      t.integer :code_factor_id
      t.integer :who_country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :who_country_factors
  end
end
