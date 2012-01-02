class CsProductCondition < ActiveRecord::Base
	establish_connection :cs_development

	set_table_name "prov_pc_product_condition"
	set_primary_key "jobkey"
	set_sequence_name "SEQ_PROV_PC"

	def save_to_db( prd_attribute, subfactor, condition_group_no )
		# cs_product_condition.promotion_code =  # NULL
		self.command = "Insert"
		self.product_code = prd_attribute.code
		self.condition_type = "Product"
		self.name = subfactor[0].upcase
		self.value = subfactor[2]
		self.op_type = subfactor[1]
		self.condition_group_no = condition_group_no
		self.crtdt = Time.now
		self.save!
	end 
end
