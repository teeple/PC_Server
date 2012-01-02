class WhereZone < ActiveRecord::Base
	has_many :where_zone_factors,
			:dependent => :destroy
	has_many :where_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Where- Zones", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_zones"       => {:value => "Zone", :type => :TITLE},
		"zones"            => {:value => "@where_zone_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 


	###########################################
	### CONDITION_WHERE_ZONE
	#[RULESET_CONDITION_WHERE_ZONE]
	#zone, string(100)
	#
	#[CONDITION_WHERE_ZONE]
	#zone_1: zone = ('Korea Kyungki Sungnam Sunae-Dong', 'Korea kyungki Sungnam Geung Ja Dong')
	#zone_3: zone = ('Korea Kyungki Sungnam Sunae-Dong', 'Korea kyungki Sungnam Geung Ja Dong')
	###########################################
	def data_to_ruleset
		items = []
		self.where_zone_factors.each do |factor|
			items << "'" + factor.title + "'" 
		end

		if items.size > 0
			return self.subfctr_name + ": zone = (" + items.join(",") + ")" 
		else
			return ""
		end
	end 
end
