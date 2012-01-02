class PrdMember < ActiveRecord::Base
	belongs_to :product
	belongs_to :member

	#validates_presence_of :user_id, :role, :hashed_password, :status, :product_id
	#validates_uniqueness_of :user_id

	@@json_mapping_table = {
	 "editing"          => {:value => "user_id", :type => :DB_FIELD, :conditions => "status ='EDITING'"},
	 "requested"        => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'REQUESTED'" },
	 "rejected"         => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'REJECTED'" },
	 "approved"         => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'APPROVED'" },
	 "activated"        => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'ACTIVATED'"},
	 "deactivated"      => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'DEACTIVATED'"},
	 "deprecated"       => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'DEPRECATED'"},
	 "closed"           => {:value => "user_id", :type => :DB_FIELD, :conditions => "status = 'CLOSED'" }
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
