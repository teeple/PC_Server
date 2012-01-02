class PrdAdditionalService < ActiveRecord::Base
	belongs_to :product
	belongs_to :additional_service
	#belongs_to :action, :polymorphic => true 

	#validates_presence_of :additional_service_id, :vas_type, :product_id, :rate, :currency
	#validates_inclusion_of :vas_type, :in => %w( OPTIONAL, DEFAULT )

	@@json_mapping_table = {
		"id"               => {:value => "id", :type => :DB_FIELD},
		"additional_service_id" => {:value => "additional_service_id", :type => :DB_FIELD},
		"name"             => {:value => "additional_service.name", :type => :EVAL},
		"vas_type"         => {:value => "vas_type", :type => :DB_FIELD},
		"bill_cycle"         => {:value => "bill_cycle", :type => :DB_FIELD},
		"rate"             => {:value => "rate", :type => :DB_FIELD},
		"currency"         => {:value => "currency", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def self.save_to_db(req_prd_additional_services, product_id)
   		prd_additional_services = []

		#delete corresponding balance_conditions 
		PrdAdditionalService.delete_all(["product_id = ? ",product_id])
		 
		req_prd_additional_services.each do |req_prd_additional_service|

			prd_additional_service = PrdAdditionalService.new

			#if prd_additional_service.save 

			prd_additional_service.additional_service_id = req_prd_additional_service['additional_service_id']
			prd_additional_service.vas_type = req_prd_additional_service['vas_type']
			prd_additional_service.rate = req_prd_additional_service['rate']
			prd_additional_service.currency = req_prd_additional_service['currency'].empty? ? "DOLLAR" : req_prd_additional_service['currency']
            prd_additional_service.bill_cycle = req_prd_additional_service['bill_cycle'].empty? ? "MONTHLY": req_prd_additional_service['bill_cycle']
			prd_additional_service.product_id = product_id
			prd_additional_service.save

			#end
		end
	end 

	def self.data_to_prd_ruleset(product_id)

		results = Hash.new
		rule_index = 0

		prd_additional_services = PrdAdditionalService.find_all_by_product_id(product_id)

		if prd_additional_services != nil && prd_additional_services.size > 0 

			prd_additional_services.each do |vas|
				result = Hash.new
				result['vas_name'] = vas.additional_service.name != nil ? vas.additional_service.name : ""
				result['is_required'] = vas.additional_service.name != nil ? vas.additional_service.vas_type : ""
				result['vas_fee'] = vas.rate != nil ? vas.rate.to_s : 0
				result['bill_term'] = "Calculated_Daily"
				result['balance'] = "GENERAL_REMAINS"

				results['rule_' + rule_index.to_s] = result 
				rule_index += 1
			end 
		end

		return results
	end
end 
