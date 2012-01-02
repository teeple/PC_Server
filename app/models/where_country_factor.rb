class WhereCountryFactor < ActiveRecord::Base
	belongs_to :where_country

	@@json_mapping_table = {
		"country_index" => {:value => "country_code", :type => :DB_FIELD},
		"country_name"  => {:value => "country_code", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
