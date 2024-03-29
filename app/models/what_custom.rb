class WhatCustom < ActiveRecord::Base
	has_many :what_factors,
			:dependent => :nullify
	has_many :what_custom_factors,
			:dependent => :destroy

	@@json_mapping_table = {
	 "view_name"   	=> {:value => "What - Custom Conditions", :type => :TITLE},
	 "name"        	=> {:value => "name", :type => :DB_FIELD},
	 "description" 	=> {:value => "description", :type => :DB_FIELD},
	 "view_customs" => {:value => "Custom Factors", :type => :TITLE},
	 "customs"     	=> {:value => "@what_custom_factors", :type => :HAS_CHILD_MULTI}
	}

	@@json_mapping_table_summary = {}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset

		items = []
		self.what_custom_factors.each do |factor|

            debugger

            if factor.name.downcase != 'amount'

                if factor.operation.downcase == "between"
                    sub_factors = factor.value.gsub "|", ","
                    items << (factor.name + " " + factor.operation + " '" + sub_factors + "' ")
                else
                    items << (factor.name  + " " + factor.operation + " '" + factor.value + "' ")
                end
            end
		end

		if items.size > 0
			return self.subfctr_name + ": " + items.join(",")
		else
			return ""
		end 

	end 
end

