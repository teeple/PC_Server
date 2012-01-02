class CsProductAddinfo < ActiveRecord::Base
	establish_connection :cs_development 

	set_table_name "prov_pc_product_addinfo"
	set_primary_key "jobkey"
	set_sequence_name "SEQ_PROV_PC"

	def save_to_db( prd_attribute, prd_promotion)
		self.command = "Insert"                
		self.product_code = prd_attribute.code
		self.name = prd_promotion.promotion.name
		self.description = prd_promotion.promotion.description
		self.save!
	end 

end
