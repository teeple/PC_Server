class CreatePrdSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :prd_subscriptions, :force => true do |t|
      t.integer :parent_id
      t.integer :condition_id
      t.stting :condition_type
      t.integer :balance_id
      t.integer :action_id
      t.string :action_type

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_subscriptions
  end
end
