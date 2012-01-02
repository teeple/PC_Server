class CreatePromotions < ActiveRecord::Migration
  def self.up
    create_table :promotions do |t|
      t.string :name
      t.string :action
      t.string :factor_name
      t.string :factor_type
      t.string :is_required

      t.timestamps
    end
  end

  def self.down
    drop_table :promotions
  end
end
