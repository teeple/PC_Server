class WhoFactor < ActiveRecord::Base
	has_one :prd_subscription, :as => :condition,
			:dependent => :nullify
	has_one :prd_tariff, :as => :condition,
			:dependent => :nullify
	has_one :prd_balance, :as => :condition,
			:dependent => :nullify

	belongs_to :who_member
	belongs_to :who_number,
			:include => :who_number_factors
	belongs_to :who_prefix,
			:include => :who_prefix_factors
	belongs_to :who_country,
			:include => :who_country_factors
	belongs_to :who_custom,
			:include => :who_custom_factors

    belongs_to :code_factor,
            :class_name => "CodeFactor",
            :foreign_key => "service_type"

	@@json_mapping_table = {
		"view_name"        => {:value => "Condition Who ", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"code"             => {:value => "fctr_code", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"who_members"      => {:value => "@who_member", :type => :HAS_CHILD},
		"who_numbers"      => {:value => "@who_number", :type => :HAS_CHILD},
		"who_prefixes"     => {:value => "@who_prefix", :type => :HAS_CHILD},
		"who_countries"    => {:value => "@who_country", :type => :HAS_CHILD},
		"who_customs"      => {:value => "@who_custom", :type => :HAS_CHILD}
	}

	@@json_mapping_table_summary = {
		"id"               => {:value => "id", :type => :DB_FIELD},
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

		if self.who_member_id
			node = self.who_member
			array_members = []

			#if node.viceversa !=nil && node.viceversa.size >0 
			#	array_members << ['viceversa', '=', node.viceversa]
			#elsif node.onoffnet != nil && node.onoffnet.size > 0
			#	array_members << ['onoffnet', '=', node.onoffnet]
			if node.memberof !=nil && node.memberof.size > 0 
				array_members << ['memberof', '=', node.memberof]
			elsif node.age !=nil && node.age > 0 && node.age_op_type !=nil && node.age_op_type.size > 0 
				array_members << ['age', node.age_op_type, node.age]
			elsif node.gender !=nil && node.gender.size > 0
				array_members << ['gender', '=', node.gender]
			end

			factors['members'] = array_members

		elsif self.who_number_id 
			nodes = self.who_number

			array_numbers = []
			nodes.who_number_factors.each do |node|
				array_numbers << ['called', '=', node.number]
			end

			factors['numbers'] = array_numbers

		elsif self.who_prefix_id
			nodes = self.who_prefix

			array_prefixs = []
			nodes.who_prefix_factors.each do |node|
				array_prefixs << ['called', '=', node.prefix]
			end 

			factors['prefixs'] = array_prefixs

		elsif self.who_country_id
			nodes = self.who_country

			array_countries = []
			nodes.who_country_factors.each do |node|
				array_countries << ['country', '=', node.country]
			end 

			factors['countries'] = array_prefixs

		elsif self.who_custom_id
			nodes = self.who_custom

			array_customs = [] 
			nodes.who_custom_factors.each do |node|
				array_customs << [node.name, node.operation, node.value]
			end 

			factors['customs'] = array_customs
		end 
		factors 
	end 

	#############################################################
	# RULESET _WHO
	# is_Family 
	#############################################################
	def data_to_prd_ruleset

		items = []

		if self.who_member_id != nil  && self.who_member_id  > 0 

			member = self.who_member

			#if member.viceversa !=nil && member.viceversa.size > 0
			#	items << "viceversa = 'true'" 
			#end 

			#if member.onoffnet !=nil && member.onoffnet.size > 0
			#	items << "onoffnet = 'true'" 
			#end 

			if member.gender !=nil && member.gender.size > 0
				items << "gender = '" + member.gender.downcase + "'"
			end 

			if member.memberof !=nil && member.memberof.size > 0 
				if member.memberof == 'FAMILY'
					items << "is_family = 'true'"

				elsif member.memberof == 'CORPORATE'
					items << "is_vpn = 'true'"
				end 
			end 

			if member.age !=nil && member.age > 0 && member.age_op_type !=nil && member.age_op_type.size > 0 
				items << "age" + member.age_op_type + " '" + member.age.to_s + "'"
			end 

		elsif self.who_number_id != nil  && self.who_number_id > 0 
			
			temp_array = []
			self.who_number.who_number_factors.each do |subfactor|
				temp_array << "'" + subfactor.number + "'"
			end 
			items << "called = ( " + temp_array.join(", ") + ")"

		elsif self.who_prefix_id != nil  && self.who_prefix_id > 0 
			
			temp_array = []
			self.who_prefix.who_prefix_factors.each do |subfactor|
				temp_array << "'" + subfactor.prefix + "'"
			end 
			items << "called starts ( " + temp_array.join(", ") + ")"

		elsif self.who_custom_id != nil  && self.who_custom_id > 0

			temp_array = []
			self.who_custom.who_custom_factors.each do |subfactor|
				temp_array << subfactor.name + subfactor.operation + "'" + subfactor.value + "'"
			end
			items << temp_array.join(", ")
		end 

        # SHOULD BE DELETED
        if self.name['option_'] 
		  return self.name + ": " + items.join(", ") + "\n"
        else
		  return self.fctr_code + ": " + items.join(", ") + "\n"
        end
	end 

	###########################################
	### CONDITION_
	#[RULESET_CONDITION_TOWHOM]
	#c_type, enum
	#c_member, string(20), rule : value in ruleset condition_who_member 
	#c_number, string(20), rule : value in ruleset condition_who_number
	#c_prefix, string(20), rule : value in ruleset condition_who_prefix 
	#c_country, string(20), rule :value in ruleset condition_who_country 
	#c_custom, string(20), rule : value in ruleset condition_who_custom
	###########################################
	def data_to_ruleset

		temp_array  = []
		rule_name = self.fctr_code.blank? ? ("rule_" + self.id.to_s) : self.fctr_code + ": "

		if not self.who_member.blank?
			temp_array << ("c_who_member = " + self.who_member.subfctr_name)
		end

		if not self.who_number.blank?
			temp_array << ("c_who_number = " + self.who_number.subfctr_name)
		end

		if not self.who_prefix.blank?
			temp_array << ("c_who_prefix = " + self.who_prefix.subfctr_name)
		end

		if not self.who_country.blank?
			temp_array << ("c_who_country = " + self.who_country.subfctr_name)
		end

		if not self.who_custom.blank?
			temp_array << ("c_who_custom = " + self.who_custom.subfctr_name)
		end

		if temp_array.size > 0
			return rule_name + temp_array.join(", ")
		else
			return ""
		end
	end
end
