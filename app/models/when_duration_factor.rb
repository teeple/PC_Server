class WhenDurationFactor < ActiveRecord::Base
	belongs_to :when_duration

	@@json_mapping_table = {
		"start_date"        => {:value => "start_date", :type => :DB_FIELD},
		"end_date"        	=> {:value => "end_date", :type => :DB_FIELD},
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
