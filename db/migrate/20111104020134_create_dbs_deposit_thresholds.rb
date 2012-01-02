class CreateDbsDepositThresholds < ActiveRecord::Migration
  def self.up
    create_table :dbs_deposit_thresholds do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :dbs_deposit_thresholds
  end
end
