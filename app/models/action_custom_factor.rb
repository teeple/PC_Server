class ActionCustomFactor < ActiveRecord::Base
    has_many :tariff_file_lists, :foreign_key => 'tariff_file_list_id'
	belongs_to :action_custom

	@@json_mapping_table = {
		"name" 			=> {:value => "name", :type => :DB_FIELD},
		"value" 		=> {:value => "value", :type => :DB_FIELD},
		"operation" 	=> {:value => "operation", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		return self.name + " " + self.operation + " " + self.value
	end 
end
