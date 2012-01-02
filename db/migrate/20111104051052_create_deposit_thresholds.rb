class CreateDepositThresholds < ActiveRecord::Migration
  def self.up
    create_table :deposit_thresholds do |t|
      t.integer :threhold
      t.string :action
      t.integer :deposit_id

      t.timestamps
    end
  end

  def self.down
    drop_table :deposit_thresholds
  end
end
