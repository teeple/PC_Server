class CsProductVa < ActiveRecord::Base
	establish_connection :cs_development

	set_table_name "prov_pc_product_vas"
	set_primary_key "jobkey"
	set_sequence_name "SEQ_PROV_PC"


	def save_to_db(prd_attribute, vas)
		self.command = "Insert"
		self.product_code = prd_attribute.code
		self.name = vas.additional_service.name.blank? ? "": vas.additional_service.name

		if vas.vas_type == 'REQUIRED'
			self.is_required = 'Y'
		else
			self.is_required = 'N'                
		end

		self.group_type = 0                
		self.group_no = 0
		if vas.rate != nil
			self.fee = vas.rate != nil ? vas.rate : 0
			self.bill_term = 'D'
		else
			self.fee = 0
			self.bill_term = 'D'                
		end
		self.description = vas.additional_service.description.blank? ? "": vas.additional_service.description
		self.crtdt = Time.now

		self.save!
	end 
end
