class WhenCustom < ActiveRecord::Base
	has_many :when_custom_factors,
			:dependent => :destroy
	has_many :when_factors,
			:dependent => :nullify

	@@json_mapping_table = {
	 "view_name"        => {:value => "When - Custom conditions", :type => :TITLE},
	 "name"             => {:value => "name", :type => :DB_FIELD},
	 "description"      => {:value => "description", :type => :DB_FIELD},
	 "view_customs"     => {:value => "Customs", :type => :TITLE},
	 "customs"          => {:value => "@when_custom_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		items = []
		self.when_custom_factors.each do |factor|

			if factor.operation.downcase == "between"
				sub_factors = factor.value.gsub "|", ","
				items << (factor.name + " " + factor.operation + " '"+ sub_factors + "' ")
			else
				items << (factor.name  + " " + factor.operation + " '"+ factor.value + "' ")
			end
		end

		if items.size > 0
			return self.subfctr_name + ": " + items.join(",")
		else
			return ""
		end 

	end 
end
