class WhereNetwork < ActiveRecord::Base
	has_many :where_network_factors,
			:dependent => :destroy
	has_many :where_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Where - Network conditions", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_networks"    => {:value => "Network", :type => :TITLE},
		"networks"         => {:value => "@where_network_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	###########################################
	### CONDITION_WHERE_NETWORK
	#[RULESET_CONDITION_WHERE_NETWORK]
	#network, string(20)
	#
	#	[CONDITION_WHERE_NETWORK]
	#	network_1: network = cdma1x
	#	network_2: network = 2G
	#	network_3: network = HSDPA
	###########################################
	def data_to_ruleset
		items = []
		self.where_network_factors.each do |factor|
			items << "'" + factor.network + "'"
		end

		if items.size > 0
			return self.subfctr_name + ": network = (" + items.join(",") + ")" 
		else
			return ""
		end
	end 
end
