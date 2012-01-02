class WhatQo < ActiveRecord::Base
	has_many :what_factors,
			:dependent => :nullify

	@@json_mapping_table = {
		"view_name"        => {:value => "Quality of Service", :type => :TITLE},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"view_qos"         => {:value => "QoS Level", :type => :TITLE},
		"qos"              => {:value => "Qos", :type => :HAS_CHILD_MULTI_AND_SELF}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		items = []

		level = 0

		level = self.level1.blank? ? 0 : 1
		level = self.level2.blank? ? 0 : 2
		level = self.level3.blank? ? 0 : 3
		level = self.level4.blank? ? 0 : 4
		level = self.level5.blank? ? 0 : 5

		if level != 0
			return self.subfctr_name + ": qos = " + level.to_s
		else
			return ""
		end

	end 

end
