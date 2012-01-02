class WhenDuration < ActiveRecord::Base
	has_many :when_duration_factors,
			:dependent => :destroy
	has_many :when_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "When - Duration conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_durations"   => {:value => "Durations", :type => :TITLE},
		"durations"        => {:value => "@when_duration_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	################################################################
	### CONDITION_WHEN_TERM
	#[RULESET_CONDITION_WHEN_TERM]
	#year_month_day, string(10)  # YYYYMMDD format
	#
	#[CONDITION_WHEN_TERM]
	#CHOOSUK: year_month_day between '20100921', '20100923'
	#LUNAR_NEWYEAR: year_month_day between '20100213', '20100215'
	#HOLIDAY: year_month_day between '20100921', '20100925'
	################################################################
	def data_to_ruleset
		items = []
		self.when_duration_factors.each do |factor|
			items << "year_month_day between '" + factor.start_date + "', '" + factor.end_date + "'"
		end 

		if items.size > 0 
			return self.subfctr_name + ": (" + items.join(" or ") + ")"
		else
			return ""
		end 
	end 

end
