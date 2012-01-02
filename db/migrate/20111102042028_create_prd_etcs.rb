class CreatePrdEtcs < ActiveRecord::Migration
  def self.up
    create_table :prd_etcs do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_etcs
  end
end
