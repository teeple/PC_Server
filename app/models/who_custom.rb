class WhoCustom < ActiveRecord::Base
	has_many :who_custom_factors,
			:dependent => :destroy
	has_many :who_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Who - Custom conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_customs"     => {:value => "Customs", :type => :TITLE},
		"customs"          => {:value => "@who_custom_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end

	def data_to_ruleset

		items = []
		self.who_custom_factors.each do |factor|

			if factor.operation.downcase == "between"
				sub_factors = factor.value.gsub "|", ","
				items << (factor.name + " " + factor.operation + " '" + sub_factors + "' ")
			else
				items << (factor.name  + " " + factor.operation + " '" + factor.value + "' ")
			end
		end

		if items.size > 0
			return self.subfctr_name + ": " + items.join(",")
		else
			return ""
		end 

	end 
end
