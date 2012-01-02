class ActionCustom < ActiveRecord::Base
	has_one :prd_subscription, :as => :action,
			:dependent => :nullify 
	has_one :prd_tariff, :as => :action,
			:dependent => :nullify 
	has_one :prd_balance, :as => :action,
			:dependent => :nullify 
	has_one :prd_additional_service, :as => :action,
			:dependent => :nullify 
	has_many :action_custom_factors,
			:dependent => :destroy

	@@json_mapping_table = {
		"id" => {:value => "level1", :type => :DB_FIELD},
		"name" => {:value => "subfctr_name", :type => :DB_FIELD},
		"code" => {:value => "subfctr_code", :type => :DB_FIELD},
		"description" => {:value => "description", :type => :DB_FIELD},
		"customs" => {:value => "@action_custom_factors", :type => :HAS_CHILD_MULTI}
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

		self.action_custom_factors.each do |sub_factor|
			items << sub_factor.data_to_ruleset
		end 

		return items

	end 

end

