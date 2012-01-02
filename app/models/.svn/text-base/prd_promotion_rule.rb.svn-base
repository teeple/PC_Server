class PrdPromotionRule < ActiveRecord::Base
	belongs_to :prd_promotion
	has_many :prd_promotion_factors,
			:dependent => :destroy
	has_many :prd_conditions,
			:class_name => "PrdPromotionFactor",
			:conditions => "cond_or_result = 'COND'",
			:dependent => :destroy 
	has_many :prd_results,
			:class_name => "PrdPromotionFactor",
			:conditions => "cond_or_result = 'RESULT'",
			:dependent => :destroy 

	#validates_presence_of :prd_promotion_id

	@@json_mapping_table = {
	 "id"           => {:value => "id", :type => :DB_FIELD},
	 "conditions"  	=> {:value => "prd_conditions", :type => :PASS_MULTI_ALIAS, :class_name => "PrdPromotionFactor"},
	 "results"   	=> {:value => "prd_results", :type => :PASS_MULTI_ALIAS, :class_name => "PrdPromotionFactor"}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
