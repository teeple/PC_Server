class WhereNetworkFactor < ActiveRecord::Base
	belongs_to :where_network

	@@json_mapping_table = {
		"network"          => {:value => "network", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
