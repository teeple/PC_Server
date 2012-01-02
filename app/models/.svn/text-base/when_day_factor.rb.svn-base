class WhenDayFactor < ActiveRecord::Base
	belongs_to :when_day

	@@json_mapping_table = {
	"day"              => {:value => "day", :type => :DB_FIELD},
	"day_type"         => {:value => "day_type", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
