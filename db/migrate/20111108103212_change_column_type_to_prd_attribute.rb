class ChangeColumnTypeToPrdAttribute < ActiveRecord::Migration
  def self.up
    change_table :prd_attributes do |t|
        t.change :bill_type, :integer 
        t.change :status, :integer
        t.change :service_type, :integer
        t.change :target_user, :integer
    end
  end

  def self.down
    change_table :prd_attribute do |t|
        t.change :bill_type, :string 
        t.change :status, :string
        t.change :service_type, :string
        t.change :target_user, :string
    end
  end
end
