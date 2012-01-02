class WhereFactor < ActiveRecord::Base
	has_one :prd_subscription, :as => :condition,
			:dependent => :nullify
	has_one :prd_tariff, :as => :condition,
			:dependent => :nullify
	has_one :prd_balance, :as => :condition,
			:dependent => :nullify

	belongs_to :where_country,
			:include => :where_country_factors
	belongs_to :where_zone,
			:include => :where_zone_factors
	belongs_to :where_network,
			:include => :where_network_factors
	belongs_to :where_custom,
			:include => :where_custom_factors

    belongs_to :code_factor,
            :class_name => "CodeFactor",
            :foreign_key => "service_type"

	@@json_mapping_table = {
		"view_name"        => {:value => "Condition Where", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"code"             => {:value => "fctr_code", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"where_countries"  => {:value => "@where_country", :type => :HAS_CHILD},
		"where_zones"      => {:value => "@where_zone", :type => :HAS_CHILD },
		"where_networks"   => {:value => "@where_network", :type => :HAS_CHILD },
		"where_customs"    => {:value => "@where_custom", :type => :HAS_CHILD }
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
		if self.where_country_id
			nodes = self.where_country

			array_countries = []

			if nodes !=nil && nodes.size > 0
				nodes.where_country_factors.each do |node|
					array_countries << ['country', '=', node.country_index]
				end

				factors['countries'] = array_countries
			end

		elsif self.where_zone_id
			nodes = self.where_zone

			array_zones = []
			nodes.where_zone_factors.each do |node|
				title = ['title', '=', '#{node.title}']
				lat = ['lat', '=', '#{node.lat}']
				lng = ['lng', '=', '#{node.lng}']
				array_zones << ['#{title}','#{lat}','#{lng}']
			end

			factors['zones'] = array_zones

		elsif self.where_network_id
			nodes = self.where_network

			array_networks = []
			nodes.where_network_factors.each do |node|
				array_networks << ['network', '=', '#{node.network}']
			end 

			factors['networks'] = array_networks

		elsif self.where_custom_id
			nodes = self.where_custom

			array_customs = [] 
			nodes.where_custom_factors.each do |node|
				array_customs << ['#{node.name}', '#{node.operation}', '#{node.value}']
			end 

			factors['customs'] = array_customs
		end 
		factors 
	end 

	#############################################################
	# RULESET _WHEN 
	# is_HomeZone
	#############################################################
	def data_to_prd_ruleset

		items = []

		if self.where_country_id != nil  && self.where_country_id > 0 

			temp_array = []
			self.where_country.where_country_factors.each do |subfactor|
				temp_array << "'" + subfactor.country_code + "'"
			end
			items << "country = (" + temp_array.join(",")  + ")"
		end 

		if self.where_zone_id != nil  && self.where_zone_id > 0

			temp_array = []
			self.where_zone.where_zone_factors.each do |subfactor|
				temp_array << "'" + subfactor.zone + "'"
			end
			items << "zone = (" + temp_array.join(",") + ")"
		end 	

		if self.where_network_id != nil  && self.where_network_id > 0

			temp_array = []
			self.where_network.where_network_factors.each do |subfactor|
				temp_array << "'" + subfactor.network + "'"
			end
			items << "network = (" + temp_array.join(",")+ ")"
		end 

		if self.where_custom_id != nil  && self.where_custom_id > 0

			temp_array = []
			self.where_custom.where_custom_factors.each do |subfactor|
				temp_array << subfactor.name + subfactor.operation + "'" + subfactor.value + "'"
			end
			items << temp_array.join(",")
		end 

		return self.fctr_code + ": " + items.join(", ")  + "\n"
	end 

	###########################################
	### CONDITION_WHERE
	#[RULESET_CONDITION_WHERE]
	#c_type, enum
	#c_country, string(20), rule : value in ruleset condition_where_country 
	#c_zone, string(20), rule : value in ruleset condition_where_zone 
	#c_network, string(20), rule : value in ruleset condition_where_network
	#c_custom, string(20), rule : value in ruleset condition_where_custom
	###########################################
	def data_to_ruleset 

		temp_array  = []
		rule_name = self.fctr_code.blank? ? ("rule_" + self.id.to_s) : self.fctr_code + ": "

		if not self.where_country.blank?
			temp_array << ("c_where_country = " + self.where_country.subfctr_name)
		end

		if not self.where_zone.blank?
			temp_array << ("c_where_zone = " + self.where_zone.subfctr_name)
		end

		if not self.where_network.blank?
			temp_array << ("c_where_network = " + self.where_network.subfctr_name)
		end

		if not self.where_custom.blank?
			temp_array << ("c_where_custom = " + self.where_custom.subfctr_name)
		end

		if temp_array.size > 0
			return rule_name + temp_array.join(", ")
		else
			return ""
		end
	end 
end
