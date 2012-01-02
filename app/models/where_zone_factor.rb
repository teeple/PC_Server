class WhereZoneFactor < ActiveRecord::Base
	belongs_to :where_zone

	@@json_mapping_table = {
		"title"    	=> {:value => "title", :type => :DB_FIELD},
		"lat"     	=> {:value => "lat", :type => :DB_FIELD},
		"lng"      	=> {:value => "lng", :type => :DB_FIELD},
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
