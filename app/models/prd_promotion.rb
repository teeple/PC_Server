class PrdPromotion < ActiveRecord::Base
	belongs_to :product
	belongs_to :promotion
	has_many :prd_promotion_rules,
			:dependent => :destroy 

	#validates_presence_of :promotion_id, :product_id

	@@json_mapping_table= {
	 "id"               => {:value => "id", :type => :DB_FIELD},
	 "promotion_id"     => {:value => "promotion_id", :type => :DB_FIELD},
	 "name"             => {:value => "promotion.name", :type => :EVAL},
	 "description"      => {:value => "promotion.description", :type => :EVAL},
	 "rules"            => {:value => "prd_promotion_rules", :type => :PASS_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

  	def self.save_to_db( req_prd_promotions, product_id)
   		prd_promotions = []

		# delete prd_promotion_rules  prd_promotion_factors together 
		PrdPromotion.delete_all(["product_id = ? ", product_id])
		 
		req_prd_promotions.each do |req_prd_promotion|

			prd_promotion = PrdPromotion.new
			if prd_promotion.save
				prd_promotion.promotion_id = req_prd_promotion['promotion_id']
				prd_promotion.product_id = product_id

				req_prd_promotion['rules'].each do |rule|

					prd_promotion_rule = PrdPromotionRule.new

					if prd_promotion_rule.save
						prd_promotion_rule.prd_promotion_id = prd_promotion.id

						if not rule['conditions'].blank? 
							rule['conditions'].each do |condition|
								prd_promotion_factor = PrdPromotionFactor.new

								prd_promotion_factor.name = condition['name']
								prd_promotion_factor.operation = condition['operator']
								prd_promotion_factor.value = condition['value']

								prd_promotion_factor.prd_promotion_rule_id = prd_promotion_rule.id

								prd_promotion_factor.cond_or_result = "COND"
								prd_promotion_factor.save 
							end 
						end 

						if not rule['results'].blank?
							rule['results'].each do |result|
								prd_promotion_factor = PrdPromotionFactor.new

								prd_promotion_factor.name = result['name']
								prd_promotion_factor.operation = result['operator']
								prd_promotion_factor.value = result['value']
								prd_promotion_factor.prd_promotion_rule_id = prd_promotion_rule.id
								prd_promotion_factor.cond_or_result = "RESULT"
								prd_promotion_factor.save
							end 
						end
					end
					prd_promotion_rule.save 
				end 
			end
			prd_promotion.save
		end
	end

  	def self.data_to_prd_ruleset(product_id, product_name)

		results = Hash.new
		rule_index = 0

		prd_promotions = PrdPromotion.find_all_by_product_id(product_id)

		if prd_promotions !=nil && prd_promotions.size > 0 
			prd_promotions.each do |prd_promotion|
				result = Hash.new
				result['promotion_type'] = prd_promotion.promotion.action_type != nil ? prd_promotion.promotion.action_type : ""
				result['promotion_name'] = prd_promotion.promotion.name !=nil ? prd_promotion.promotion.name : ""

				results['rule_' + rule_index.to_s] = result 
				rule_index += 1

				PrdPromotion.save_to_ruleset_each_promotion(prd_promotion, product_name)
			end 
		end

		return results
  	end

	def self.save_to_ruleset_each_promotion(prd_promotion, product_name)
		factor_definitions = []
		rules = []

		# make promotion definition
		factor_definitions << ('[RULESET_PROMOTION_' + prd_promotion.promotion.name.upcase + ']')
		factor_definitions << "product_name, string(20), rule :(value in ruleset product_list or value is null)"

		prd_promotion.promotion.promotion_factors.each do |factor|
			case factor.cond_or_result 
				when "COND":
					factor_definitions << (factor.name + ', string(20) ') 
				when "RESULT":
					factor_definitions << (factor.name + ', string(20), result')
			end
		end 

		# make promotion rules
		ruleset_header  = "[PROMOTION_" + prd_promotion.promotion.name.upcase + "]\n"
		prd_promotion.prd_promotion_rules.each do |promotion_rule|
			rule_name = 'rule_' + promotion_rule.id.to_s

			rule_factors = []
			temp_name = product_name.downcase.gsub " ", "_"
			rule_factors << ('product_name = ' + temp_name)
			promotion_rule.prd_promotion_factors.each do |factor|
				rule_factors << (factor.name + factor.operation + factor.value)
			end

			if rule_factors.size > 1
				rules << rule_name + ": " + rule_factors.join(",")
			end
		end

		prd_name = product_name.downcase.gsub " ", "_"
		temp_name = prd_promotion.promotion.name.downcase.gsub " ", "_"
		promotion_file_name = RULE_PATH + sprintf(RULE["Promotion"]["rule"], temp_name)

		saved = []
		is_exist = 0

		if File.exist?(promotion_file_name)
			is_exist = 1

			matching_option = "[' =']" + prd_name +"[' ,']"
			file = File.open(promotion_file_name)
			file.each do |line|

				if line.include? prd_name
					if not line.match(matching_option)
						saved << line
					end
				else
					saved << line
				end
			end 
			file.close

			saved << rules.join("\n")
		end 

		# in case not exist promotion_ruleset file
		if is_exist == 0
			file = File.new(promotion_file_name, "w")
			file << factor_definitions.join("\n")
			file << "\n\n"
			file << ruleset_header + "\n"
			file << rules.join("\n")
			file.close

		# in case exist promotion_ruleset file
		else 
			file = File.new(promotion_file_name, "w")
			file << saved
			file.close 
		end
	end 
end 

