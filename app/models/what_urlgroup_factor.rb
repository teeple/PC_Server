class WhatUrlgroupFactor < ActiveRecord::Base
	belongs_to :what_urlgroup

	@@json_mapping_table = {
		"url" => {:value => "url", :type => :DB_FIELD}
	}

	@@json_mapping_table_summary = {}


	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
