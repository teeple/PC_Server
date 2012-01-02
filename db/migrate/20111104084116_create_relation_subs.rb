class CreateRelationSubs < ActiveRecord::Migration
  def self.up
    create_table :relation_subs do |t|
      t.integer :parent_id
      t.integer :prd_attribute_id
      t.integer :relation_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relation_subs
  end
end
