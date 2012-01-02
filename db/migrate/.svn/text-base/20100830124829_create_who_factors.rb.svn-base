class CreateWhoFactors < ActiveRecord::Migration
  def self.up
    create_table :who_factors do |t|
      t.string :fctr_code
      t.string :member_name
      t.string :number_name
      t.string :prefix_name
      t.string :country_name
      t.string :custom_name

      t.timestamps
    end
  end

  def self.down
    drop_table :who_factors
  end
end
