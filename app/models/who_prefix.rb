class WhoPrefix < ActiveRecord::Base
	has_many :who_prefix_factors,
			:dependent => :destroy
	has_many :who_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Who - Prefixes", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_prefixes"    => {:value => "Prefix", :type => :TITLE},
		"prefixes"         => {:value => "@who_prefix_factors", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	###########################################
	### CONDITION_WHO_PREFIX
	#[RULESET_CONDITION_WHO_PREFIX]
	#prefix, string(20)
	#
	#[CONDITION_WHO_PREFIX]
	#prefix_1: prefix starts ( '070', '080' )
	#prefix_2: prefix starts ( '002', '001', '00365', '00700' )

	def data_to_ruleset
		items = []
		self.who_prefix_factors.each do |factor|
			items << "'" + factor.prefix + "'"
		end 

		if items.size > 0
			return self.subfctr_name + ": called starts (" + items.join(",") + ")"
		else
			return ""
		end
	end
end
