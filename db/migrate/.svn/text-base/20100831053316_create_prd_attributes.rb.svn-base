class CreatePrdAttributes < ActiveRecord::Migration
  def self.up
    create_table :prd_attributes do |t|
      t.string :code
      t.string :name
      t.text :description
      t.string :status
      t.string :type
      t.integer :product_id

      t.timestamps
    end
  end

  def self.down
    drop_table :prd_attributes
  end
end
