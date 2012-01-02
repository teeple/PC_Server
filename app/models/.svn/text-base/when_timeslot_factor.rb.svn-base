class WhenTimeslotFactor < ActiveRecord::Base
	belongs_to :when_timeslot

	@@json_mapping_table = {
		"start_time"  => {:value => "start_time", :type => :DB_FIELD},
		"end_time"    => {:value => "end_time", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
