class ChangeRelationTypeToRelation < ActiveRecord::Migration
  def self.up
    change_table :relations do |t|
        t.change :relation_type, :integer
    end
  end

  def self.down
    change_table :relations do |t|
        t.change :relation_type, :string
    end
  end
end
