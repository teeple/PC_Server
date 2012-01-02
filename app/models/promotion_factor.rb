class PromotionFactor < ActiveRecord::Base
	belongs_to :promotion
	#has_many :prd_promotion_factors,
	#		:dependent => :nullify

	validates_presence_of :name, :promotion_id, :cond_or_result, :is_required
	validates_uniqueness_of :name
	validates_inclusion_of :cond_or_result, :in => %w( COND RESULT )
	validates_inclusion_of :is_required, :in => %w( YES NO )

	@@json_mapping_table = {
		"name"          => {:value => "name", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		@@json_mapping_table
	end
end
