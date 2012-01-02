class ActionDiscount < ActiveRecord::Base
	has_one :prd_subscription, :as => :action,
			:dependent => :nullify
	has_one :prd_tariff, :as => :action,
			:dependent => :nullify
	has_one :prd_balance, :as => :action,
			:dependent => :nullify
	belongs_to :unit_type,
			:class_name => "CodeFactor",
			:foreign_key => "uptounit"
	belongs_to :currency,
			:class_name => "CodeFactor",
			:foreign_key => "rateunit"
	

	@@json_mapping_table = {
		"view_name" 		=> {:value => "TARIFF", :type => :TITLE},
		"name" 				=> {:value => "subfctr_name", :type => :DB_FIELD},
		"code" 				=> {:value => "subfctr_code", :type => :DB_FIELD},
		"description" 		=> {:value => "description", :type => :DB_FIELD},
		"upto" 				=> {:value => "upto", :type => :DB_FIELD},
		"uptounit" 			=> {:value => "uptounit", :type => :DB_FIELD},
		"rate" 				=> {:value => "rate", :type => :DB_FIELD},
		"rateunit" 			=> {:value => "rateunit", :type => :DB_FIELD},		
		"view_upto" 		=> {:value => "Upto", :type => :TITLE},
		"view_uptounit" 	=> {:value => "Type of Upto ", :type => :TITLE},
		"view_rate" 		=> {:value => "Rate ", :type => :TITLE},
		"view_rateunit" 	=> {:value => "Type of Rate ", :type => :TITLE}

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
		item = Hash.new

		item['unit_type'] =  self.unit_type.blank? ? "": self.unit_type.name
		#item['upto_amount'] = self.upto != nil ? self.upto.to_s : 0
		#item['amount'] = self.rate != nil ? self.rate.to_s : 0
		item['amount'] = self.upto != nil ? (100 - self.upto).to_s : 0

		item
	end 
end
