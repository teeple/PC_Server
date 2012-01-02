class WhoNumberFactor < ActiveRecord::Base
	belongs_to :who_number

	@@json_mapping_table = {
		"number"           => {:value => "number", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
