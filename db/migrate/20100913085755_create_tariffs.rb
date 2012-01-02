class CreateTariffs < ActiveRecord::Migration
  def self.up
    create_table :tariffs do |t|
      t.string :name
      t.float :unit
      t.string :unit_type
      t.float :rate
      t.string :currency

      t.timestamps
    end
  end

  def self.down
    drop_table :tariffs
  end
end
