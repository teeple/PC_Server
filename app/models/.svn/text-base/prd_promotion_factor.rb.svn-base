class PrdPromotionFactor < ActiveRecord::Base
	belongs_to :prd_promotion_rule
	#belongs_to :promotion_factor

	#validates_presence_of :name, :operation, :value, :prd_promotion_rule_id, :promotion_factor_id

	@@json_mapping_table = {
		"name"    	=> {:value => "name", :type => :DB_FIELD},
		"operator" 	=> {:value => "operation", :type => :DB_FIELD},
		"value"    	=> {:value => "value", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
