class ActionAllow < ActiveRecord::Base
	has_one :prd_subscription, :as => :action,
			:dependent => :nullify 
	has_one :prd_tariff, :as => :action, 
			:dependent => :nullify 
	has_one :prd_balance, :as => :action, 
			:dependent => :nullify
	belongs_to :unit_type,
			:class_name => "CodeFactor",
			:foreign_key => "unit"
	belongs_to :currency_type,
			:class_name => "CodeFactor",
			:foreign_key => "currency"

	@@json_mapping_table = {
		"view_name" 	=> {:value => "Free Usage ", :type => :TITLE},
		"name" 			=> {:value => "subfctr_name", :type => :DB_FIELD},
		"code" 			=> {:value => "subfctr_code", :type => :DB_FIELD},
		"description" 	=> {:value => "description", :type => :DB_FIELD},
		"give" 			=> {:value => "give", :type => :DB_FIELD},
		"unitgive" 		=> {:value => "unitgive", :type => :DB_FIELD}
	}

	@@json_mapping_table_summary = {
		"id" 			=> {:value => "id", :type => :DB_FIELD},
		"name" 			=> {:value => "subfctr_name", :type => :DB_FIELD},
		"description" 	=> {:value => "description", :type => :DB_FIELD},
		"code" 			=> {:value => "subfctr_code", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def self.json_mapping_table_summary 
		return @@json_mapping_table_summary
	end

	def data_to_ruleset
		item = Hash.new

		item['unit_type'] = self.unit_type.blank? ? "": self.unit_type.name

		#if currency_type.blank? 
		#	item['unit_type'] = self.currency_type.blank? ? "":  self.currency_type.name
		#end
		item['amount'] = self.give != nil ? self.give : 0

		item 
	end 

end
