class CodeFactor < ActiveRecord::Base
	belongs_to :code,
            :class_name => "Code",
            :foreign_key => "code_id"
	has_many :what_factors,
			:dependent => :nullify
	has_many :action_deduct_factors,
			:foreign_key => "upto_type",
			:dependent => :nullify 
	has_many :tariffs,
			:foreign_key => "unit_type",
			:dependent => :nullify 
	has_many :tariffs,
			:foreign_key => "currency",
			:dependent => :nullify 
	has_many :members,
			:foreign_key => "user_class",
			:dependent => :nullify
	has_many :members,
			:foreign_key => "user_role",
			:dependent => :nullify
	has_many :additional_services,
			:foreign_key => "currency_factor_id",
			:dependent => :nullify
    has_many :what_factors,
            :class_name => "WhatFactor",
            :foreign_key => "service_type"
    has_many :who_factors,
            :class_name => "WhoFactor",
            :foreign_key => "service_type"
    has_many :when_factors,
            :class_name => "WhenFactor",
            :foreign_key => "service_type"
    has_many :where_factors,
            :class_name => "WhereFactor",
            :foreign_key => "service_type"
    has_many :prd_attributes,
            :class_name => "PrdAttribute",
            :foreign_key => "service_type"
    has_many :prd_attributes,
            :class_name => "PrdAttribute",
            :foreign_key => "bill_type"
    has_many :relations,
            :class_name => "Relation",
            :foreign_key => "relation_type_id"

	@@json_mapping_table = {
		"id"		=> {:value => "id", :type => :DB_FIELD},
		"name"		=> {:value => "name", :type => :DB_FIELD},
		"code_id"	=> {:value => "code_id", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end
end
