class WhoCountry < ActiveRecord::Base
	has_many :who_country_factors,
			:dependent => :destroy
	has_many :who_factors,
			:dependent => :nullify

	@@json_mapping_table = { 
		"view_name"        => {:value => "Who - Country conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"is_same_country"  => {:value => "is_same_country", :type => :DB_FIELD},
		"view_is_same_country" => {:value => "called party in same country ", :type => :TITLE},
		"is_same_zone"     => {:value => "is_same_zone", :type => :DB_FIELD},
		"view_is_same_zone"=> {:value => "called party in same zone ", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"view_countries"   => {:value => "Country", :type => :TITLE},
		"countries"        => {:value => "@where_network_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	###########################################
	### CONDITION_TOWHOM_COUNTRY
	#[RULESET_CONDITION_TOWHOM_COUNTRY]
	#country, enum
	#
	#[CONDITION_TOWHOM_COUNTRY]
	#country_1: country = ( 1, 2, 3, 4)
	#country_2: country = ( 1, 2, 3, 4, 5, 6 )
	###########################################
	def data_to_ruleset
		items = []
		self.who_country_factors.each do |factor|
			items << "'" + factor.country_code + "'"
		end

		if items.size > 0
			return self.subfctr_name + ": country = (" + items.join(",") + ")" 
		else
			return ""
		end
	end 
end
