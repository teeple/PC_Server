class WhenDay < ActiveRecord::Base
	has_many :when_day_factors,
			:dependent => :destroy
	has_many :when_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "When - Day conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_days"   	   => {:value => "Days", :type => :TITLE},
		"days"        	=> {:value => "@when_day_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	###########################################
	### CONDITION_WHEN_DAY
	# [RULESET_CONDITION_WHEN_DAY]
	# day, string(10)
	# day_of_month, string(10)
	#
	#	[CONDITION_WHEN_DAY]
	#25: day = ('20100125', '20100225', ... )
	#3_1: day = '20100301'
	#5_5: day = '20100505'
	#4_5: day = '20100405'
	###########################################
	def data_to_ruleset 

		when_day = []
		items_day = []
		items_mday = []

		self.when_day_factors.each do |factor|

			case factor.day_type.upcase 
				when "DAY": 
					items_day << "'" + factor.day + "'"
				when "MDAY": 
					items_mday << "'" + factor.day + "'"
			end
		end 

		if items_day.size > 0 
			when_day << "day = (" + items_day.join(", ") + ")" 
		end

		if items_mday.size > 0 
			when_day << "day_of_month = (" + items_mday.join(", ") + ")" 
		end

		if when_day.size > 0 
			return self.subfctr_name + ": " + when_day.join(", ")
		else
			return ""
		end
	end 
end
