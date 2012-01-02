class WhenTimeslot < ActiveRecord::Base
	has_many :when_timeslot_factors,
			:dependent => :destroy
	has_many :when_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "When - Timeslot conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_timeslots"   => {:value => "TimeSlots", :type => :TITLE},
		"timeslots"        => {:value => "@when_timeslot_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		when_timeslot = []

		self.when_timeslot_factors.each do |factor|
			when_timeslot << "time between '" + factor.start_time + "', '" + factor.end_time + "'"
		end 

		if when_timeslot.size > 0 
			return self.subfctr_name + ": (" + when_timeslot.join(" or ") + ")"
		else 
			""
		end
	end 
end
