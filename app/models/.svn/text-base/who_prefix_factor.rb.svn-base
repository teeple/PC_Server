class WhoPrefixFactor < ActiveRecord::Base
	belongs_to :who_prefix

	@@json_mapping_table = {
		"prefix"           => {:value => "prefix", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
