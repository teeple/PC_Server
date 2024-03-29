class WhoMember < ActiveRecord::Base
	has_many :who_factors,
		:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Who-Members", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"viceversa"        => {:value => "viceversa", :type => :DB_FIELD},
		"onoffnet"         => {:value => "onoffnet", :type => :DB_FIELD},
		"memberof"         => {:value => "memberof", :type => :DB_FIELD},
		"age"              => {:value => "age", :type => :DB_FIELD},
		"age_op_type"      => {:value => "age_op_type", :type => :DB_FIELD},
		"gender"           => {:value => "gender", :type => :DB_FIELD},                 "view_viceversa"   => {:value => "Same Price Plan", :type => :TITLE},
		"view_onoffnet"    => {:value => "Same Telco", :type => :TITLE},
		"view_memberof"    => {:value => "Member of Family/Corporate", :type => :TITLE},
		"view_age"         => {:value => "Age", :type => :TITLE},
		"view_age_op_type" => {:value => "Operation", :type => :TITLE},
		"view_gender"      => {:value => "Gender", :type => :TITLE},
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	###########################################
	### CONDITION_TOWHOM_MEMBER
	#[RULESET_CONDITION_TOWHOM_MEMBER]
	#vice_versa, string(15)
	#on_off_net, string(15)
	#member_of, string(15)
	###########################################
	def data_to_ruleset
		items = []
		#items << ("vice_versa = '" + self.viceversa.downcase + "'") if not self.viceversa.blank? 
		#items << ("on_off_net = '" + self.onoffnet.downcase + "'") if not self.onoffnet.blank? 
		items << ("member_of  = '" + self.memberof.downcase + "'") if not self.memberof.blank? 
		items << ("gender = '" + self.gender.downcase + "'") if not self.gender.blank? 

		if not self.age_op_type.blank? 
			if self.age_op_type.downcase == "between"
				items << ("age " + self.age_op_type + age.split("|").join(","))
			else
				items << ("age " + self.age_op_type + age.to_s)
			end
		end

		if items.size > 0
			return self.subfctr_name + ": " + items.join(", ")
		else
			return ""
		end
	end 
end
