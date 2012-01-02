class WhereCustomFactor < ActiveRecord::Base
	belongs_to :where_custom

	@@json_mapping_table = {
		"name"             => {:value => "name", :type => :DB_FIELD},
		"operation"        => {:value => "operation", :type => :DB_FIELD},
		"value"            => {:value => "value", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
