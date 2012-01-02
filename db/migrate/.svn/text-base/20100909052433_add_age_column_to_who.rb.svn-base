class AddAgeColumnToWho < ActiveRecord::Migration
  def self.up
  	add_column :who_members,  :age, :integer 
  	add_column :who_members,  :age_op_type, :string 
  end

  def self.down
  	remove_column :who_members, :age
  	remove_column :who_members,  :age_op_type
  end
end
