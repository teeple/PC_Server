class Code < ActiveRecord::Base
	has_many :code_factors,
			:dependent => :destroy

	@@json_mapping_table = {
		"id"		=> {:value => "id", :type => :DB_FIELD},
		"name"		=> {:value => "name", :type => :DB_FIELD},
		"factors" 	=> {:value => "@code_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset_enum
		items = []

		self.code_factors.each do |factor|
			items << factor.id.to_s + "\t" + factor.name
		end
		items.join("\n")
	end 
end
