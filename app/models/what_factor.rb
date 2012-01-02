class WhatFactor < ActiveRecord::Base
	has_one :prd_subscription, :as => :condition,
			:dependent => :nullify 
	has_one :prd_tariff, :as => :condition,
			:dependent => :nullify
	has_one :prd_balance, :as => :condition,
			:dependent => :nullify
	belongs_to :code_factor,
            :class_name => "CodeFactor",
            :foreign_key => "code_factor_id"
	belongs_to :what_urlgroup,
			:include => :what_urlgroup_factors
	belongs_to :what_qo
	belongs_to :what_custom,
			:include => :what_custom_factors

    belongs_to :service_type,
            :class_name => "CodeFactor",
            :foreign_key => "service_type"

	@@json_mapping_table = {
	 "view_name"        => {:value => "CONDITION_WHAT", :type => :TITLE},
	 "name"             => {:value => "name", :type => :DB_FIELD},
  	 "code"             => {:value => "fctr_code", :type => :DB_FIELD},
	 "description"      => {:value => "description", :type => :DB_FIELD},
	 "what_url_groups"  => {:value => "@what_urlgroup", :type => :HAS_CHILD},
	 "what_qos"         => {:value => "@what_qo", :type => :HAS_CHILD},
	 "what_customs"     => {:value => "@what_custom", :type => :HAS_CHILD}
	}

	@@json_mapping_table_summary = {
	 "id"        		=> {:value => "id", :type => :DB_FIELD},
	 "name"             => {:value => "name", :type => :DB_FIELD},
  	 "code"             => {:value => "fctr_code", :type => :DB_FIELD},
	 "description"      => {:value => "description", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def self.json_mapping_table_summary
		return @@json_mapping_table_summary
	end 

	def subfactors
		factors = Hash.new
		factors['what'] = ['name', '=', self.name]

		factors
	end 

	def data_to_ruleset

		temp_array = []
		rule_name = self.name.blank? ? ("rule_" + self.id.to_s) : self.name + ": "
        if self.name['option_'] 
		    factor =  self.name.blank? ? "": ("promotion = " + self.name)
		    temp_array << factor if not factor.blank? 
        end

		factor =  self.code_factor.blank? ? "": ("service_id = " + self.code_factor.name)
		temp_array << factor if not factor.blank? 

		if self.code_factor.name == 'PC_PACKET' 
			factor = self.rating_group.blank? ? "": ("rating_group  = " + self.rating_group.to_s)
			temp_array << factor if not factor.blank? 
		end

		factor = self.what_qo.blank? ? "": "c_what_qo  = " + self.what_qo.subfctr_name
		temp_array << factor if not factor.blank?

		factor = self.what_urlgroup.blank? ? "": "c_what_urlgroup  = " + self.what_urlgroup.subfctr_name
		temp_array << factor if not factor.blank?

		factor = self.what_custom.blank? ? "": "c_what_custom  = " + self.what_custom.subfctr_name
		temp_array << factor if not factor.blank?

		if temp_array.size > 0 
			return rule_name + temp_array.join(",")
		else
			return ""
		end
	end 

end

