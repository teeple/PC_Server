class TypeChangeInBalances < ActiveRecord::Migration
  def self.up
    change_table :balances do |t|
        t.change :expire_date, :string
    end
  end

  def self.down
    change_table :balances do |t|
        t.change :expire_date, :date
    end
  end
end
