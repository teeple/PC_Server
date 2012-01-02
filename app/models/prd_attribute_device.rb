class PrdAttributeDevice < ActiveRecord::Base
	belongs_to :prd_attribute
	belongs_to :code_factor
	belongs_to :product

	#validates_presence_of :code_factor_id, :prd_attribute_id

	@@json_mapping_table = {
		"device"      => {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "code_factor_id" }
		#"device"      => {:value => "code_factor.name", :type => :OBJECT_FIELD}
	}

	def self.json_mapping_table
		@@json_mapping_table
	end 

end
