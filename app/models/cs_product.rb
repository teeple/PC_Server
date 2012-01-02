class CsProduct < ActiveRecord::Base
	#establish_connection :cs_development

	#set_table_name "prov_pc_product"
	#set_primary_key "jobkey"
	#set_sequence_name "SEQ_PROV_PC"

	def save_to_db( prd_attribute, subscription_fee)
		self.command = "Insert"
		self.service_type = "CCF"

		self.code = prd_attribute.code.upcase
		self.name = prd_attribute.name
		self.description = prd_attribute.description
		self.billing_type = prd_attribute.bill_type
		self.product_type = prd_attribute.prd_type.upcase
		self.subscription_fee = subscription_fee
		self.status = prd_attribute.status.upcase
		self.crtdt = Time.now.advance(:hours => -9)

		if not prd_attribute.prd_attribute_devices.blank?
			temp_array = []
			prd_attribute.prd_attribute_devices.each do |device|
				temp_array << device.code_factor.name
			end
		end

		self.device_list = temp_array.join(",") if not temp_array.blank?
		self.save!
	end

    def make_json( prd_attribute )
    end

    def send_to_cs( )
    end
end
