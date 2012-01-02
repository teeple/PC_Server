class WhatUrlgroup < ActiveRecord::Base
	has_many :what_factors,
			:dependent => :nullify
	has_many :what_urlgroup_factors,
			:dependent => :destroy

	@@json_mapping_table = {
		"view_name"        => {:value => "URL Group", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_url_groups"  => {:value => "URL Group", :type => :TITLE },
		"url_groups"       => {:value => "@what_urlgroup_factors", :type => :HAS_CHILD_MULTI}
	}

	@@json_mapping_table_summary = {}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		
		items = []
		self.what_urlgroup_factors.each do |factor|
			items << "'" + factor.url + "'"
		end 

		if items.size > 0
			return self.subfctr_name + ": url = (" + items.join(", ") + ")"
		else
			return ""
		end
	end 

end
