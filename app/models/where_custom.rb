class WhereCustom < ActiveRecord::Base
	has_many :where_custom_factors,
			:dependent => :destroy
	has_many :where_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"country_index" => {:value => "code_factor_id", :type => :DB_FIELD},
		"country_name"  => {:value => "name", :type => :FOREIGN_DB_FIELD, :find_sql => "CodeFactor.find(self.code_factor_id)" }
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset

		items = []
		self.where_custom_factors.each do |factor|

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
