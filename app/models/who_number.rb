class WhoNumber < ActiveRecord::Base
	has_many :who_number_factors,
			:dependent => :destroy
	has_many :who_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Who - Numbers", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_numbers"     => {:value => "Number", :type => :TITLE},
		"numbers"          => {:value => "@who_number_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 


	###########################################
	### CONDITION_TOWHOM_NUMBER
	#[RULESET_CONDITION_TOWHOM_NUMBER]
	#number, string(20)
	###########################################
	def data_to_ruleset

		items = []
		self.who_number_factors.each do |factor|
			items << "'" + factor.number + "'"
		end 

		if items.size > 0
			return self.subfctr_name + ": number = (" + items.join(",") + ")"
		else
			return ""
		end
	end 
end
