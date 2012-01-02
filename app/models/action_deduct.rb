class ActionDeduct < ActiveRecord::Base
	has_one :prd_subscription, :as => :action,
			:dependent => :nullify
	has_one :prd_tariff, :as => :action, 
			:dependent => :nullify
	has_one :prd_balance, :as => :action,
			:dependent => :nullify
	has_one :prd_additional_service, :as => :action,
			:dependent => :nullify
	has_many :action_deduct_factors,
			:include => :tariff, 
			:dependent => :destroy

	@@json_mapping_table = {
		"view_name" 		=> {:value => "DEDUCT", :type => :TITLE},
		"name" 				=> {:value => "subfctr_name", :type => :DB_FIELD},
		"code" 				=> {:value => "subfctr_code", :type => :DB_FIELD},
		"description" 		=> {:value => "description", :type => :DB_FIELD},
		"view_deducts" 		=> {:value => "Deduct Rate Table", :type => :DB_FIELD},
		"header_deducts" 	=> {:value => "HeaderDeduct", :type => :HAS_CHILD_AND_SELF},
		"deducts" 			=> {:value => "@action_deduct_factors", :type => :HAS_CHILD_MULTI}
	}

	@@json_mapping_table_summary = {
		"id"            => {:value => "id", :type => :DB_FIELD},
		"name"          => {:value => "subfctr_name", :type => :DB_FIELD},
		"description"   => {:value => "description", :type => :DB_FIELD},
		"code"          => {:value => "subfctr_code", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def self.json_mapping_table_summary
		return @@json_mapping_table_summary
	end 

	def data_to_ruleset
		items = []

		self.action_deduct_factors.each do |sub_factor|

            if not sub_factor.data_to_ruleset.empty? 
			    items << sub_factor.data_to_ruleset
            end
		end 

		return items

	end 

end

