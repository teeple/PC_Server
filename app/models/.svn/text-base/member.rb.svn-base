class Member < ActiveRecord::Base
	belongs_to :user_role_type, 
			:class_name => "CodeFactor",
			:foreign_key => "user_role"
	belongs_to :user_class_type,
			:class_name => "CodeFactor",
			:foreign_key => "user_class"

	@@json_mapping_table = {
	 "id"				=> {:value => "id", :type => :DB_FIELD},
	 "user_id"			=> {:value => "user_id", :type => :DB_FIELD},
	 "user_name"		=> {:value => "user_name", :type => :DB_FIELD},
	 "user_class"		=> {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "user_class_type" },
	 "user_role"		=> {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "user_role_type"},
	 "phone"			=> {:value => "phone", :type => :DB_FIELD},
	 "email"			=> {:value => "email", :type => :DB_FIELD},
	 "created_at"		=> {:value => "created_at", :type => :DB_FIELD},
	 "updated_at"		=> {:value => "updated_at", :type => :DB_FIELD},
	 "accessed_at"		=> {:value => "accessed_at", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end
end

