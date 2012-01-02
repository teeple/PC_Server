class CreateWhoPrefixes < ActiveRecord::Migration
  def self.up
    create_table :who_prefixes do |t|
      t.string :subfctr_name
      t.string :description
      t.string :prefix

      t.timestamps
    end
  end

  def self.down
    drop_table :who_prefixes
  end
end
