class Promotion < ActiveRecord::Base
	has_many :promotion_factors,
			:dependent => :destroy
	has_many :factor_conditions,
			:dependent => :destroy,
			:class_name => "PromotionFactor",
			:foreign_key => "promotion_id",
			:conditions => "cond_or_result='COND'"
	has_many :factor_results,
			:dependent => :destroy,
			:class_name => "PromotionFactor",
			:foreign_key => "promotion_id",
			:conditions => "cond_or_result='RESULT'"

	validates_presence_of :name, :action_type, :code
	validates_uniqueness_of :name, :code

	@@json_mapping_table = {
		"id"           	=> {:value => "id", :type => :DB_FIELD},
		"code" 			=> {:value => "code", :type => :DB_FIELD},
		"name"         	=> {:value => "name", :type => :DB_FIELD},
		"description"   => {:value => "description", :type => :DB_FIELD},
		"action_type"   => {:value => "action_type", :type => :DB_FIELD},
		"conditions"    => {:value => "@factor_conditions", :type => :HAS_CHILD_MULTI_AND_DUMMY},
		"results"    	=> {:value => "@factor_results", :type => :HAS_CHILD_MULTI_AND_DUMMY}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
