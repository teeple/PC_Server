class WhatCustomFactor < ActiveRecord::Base
	belongs_to :what_custom

	@@json_mapping_table = {
		"name"             => {:value => "name", :type => :DB_FIELD},
		"operation"        => {:value => "operation", :type => :DB_FIELD},
		"value"            => {:value => "value", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 
end
