class PrdBalance < ActiveRecord::Base
	belongs_to :product
	belongs_to :balance
	has_many :prd_balance_conditions,
			:dependent => :destroy 
	acts_as_tree :order => "id"

	#validates_presence_of :balance_id, :priority, :product_id

	@@json_mapping_table = {
	 "id"               => {:value => "id", :type => :DB_FIELD},
	 "parent_id"        => {:value => "parent_id", :type => :DB_FIELD},
	 "name"             => {:value => "balance.name", :type => :EVAL},
	 "balance_id"       => {:value => "balance_id", :type => :DB_FIELD},
	 "prd_balance_conditions" => {:value => "@prd_balance_conditions", :type => :HAS_CHILD_MULTI}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

    def self.save_conditions(prd_conditions, condition_id, condition_type)
      case condition_type.downcase
        when "who":
          prd_conditions[:who] << condition_id
        when "what":
          prd_conditions[:what] << condition_id
        when "where":
          prd_conditions[:where] << condition_id
        when "when":
          prd_conditions[:when] << condition_id
        else
      end
    end

	def self.save_to_db( req_prd_balances, product_id)

		PrdBalance.delete_all(["product_id = ? ", product_id])
		mapping_table = Hash.new

		prd_balances = []

		req_prd_balances.each do |req_prd_balance|
			prd_balance = PrdBalance.new

			if prd_balance.save

				mapping_table[req_prd_balance['id']] = prd_balance.id
	
				prd_balance.balance_id = req_prd_balance['balance_id']

				prd_balance.parent_id = req_prd_balance['parent_id']
				prd_balance.product_id = product_id

				mapping_table_sub = Hash.new

				prd_balance_conditions = []
				if req_prd_balance['prd_balance_conditions'] != nil
					req_prd_balance['prd_balance_conditions'].each do |req_prd_balance_condition|
					prd_balance_condition = PrdBalanceCondition.new
	
					if prd_balance_condition.save
						mapping_table_sub[req_prd_balance_condition['id']]= prd_balance_condition.id

						prd_balance_condition.parent_id = req_prd_balance_condition['parent_id']
						prd_balance_condition.condition_id = req_prd_balance_condition['condition_id']
						prd_balance_condition.condition_type = req_prd_balance_condition['type'].capitalize + "Factor"
						prd_balance_condition.prd_balance_id = prd_balance.id
					end

					prd_balance_conditions << prd_balance_condition
				end

				prd_balance_conditions.each do |prd_balance_condition|

					if mapping_table_sub.has_key? prd_balance_condition['parent_id'].to_s
						prd_balance_condition.parent_id = mapping_table_sub[prd_balance_condition['parent_id'].to_s]
					else
						prd_balance_condition.parent_id = 0

					end
					prd_balance_condition.save
				end
			end
		end

		prd_balances << prd_balance
		end

		prd_balances.each do |prd_balance|
			if mapping_table.has_key? prd_balance['parent_id'].to_s
				prd_balance.parent_id = mapping_table[prd_balance['parent_id'].to_s]
			else
				prd_balance.parent_id = 0
			end
			prd_balance.save
		end
  	end

	def self.data_to_prd_ruleset(product_id, prd_conditions)
		rule_index = 0

        product = Product.find(product_id)
        product_type = product.prd_attribute.prd_type
        product_code = product.prd_attribute.code 

        priority = product_type.downcase == 'packaged' ? 1000 : 1

		conditions = "product_id = " + product_id.to_s + " and (parent_id != 0 or parent_id != null)" 
		prd_balances = PrdBalance.find(:all, :conditions => conditions ) # root 

		if prd_balances.size > 0 

			results = []
			prd_balance = PrdBalance.new
			prd_balance = prd_balances[0]

			while prd_balance !=nil && prd_balance.id > 0 do 

				result = []
				if prd_balance.balance_id !=nil && prd_balance.balance_id > 0 

					#product_code = prd_product.prd_attribute.code.downcase.gsub " ", "_"
                    #if product_type.downcase == 'packaged' 
					#    result << 'package_code = ' + product_code
                    #else
					#    result << 'product_code = ' + product_code
                    #end

					result << 'counter_name = ' + prd_balance.balance.name
					result << 'counter_type = ' + prd_balance.balance.balance_type 
					result << 'priority = ' + priority.to_s
					priority += 1

					if prd_balance.prd_balance_conditions != nil 

						prd_balance.prd_balance_conditions.each do |node|
							if node.condition_id
								condition_type = node.condition_type.gsub "Factor",""
								name = 'condition_' + condition_type.downcase

								if condition_type.downcase == 'what'
									value = node.condition.name
								else
									value = node.condition.fctr_code
								end

								save_conditions(prd_conditions, node.condition_id, condition_type)
							end 

							if name != nil && value != nil
								result <<  name + ' = '  + value 
							end
						end 

					end 

					results << 'rule_'+ prd_balance.balance_id.to_s + ': ' + result.join(", ") + "\n"
					rule_index += 1
				end

				prd_balance = prd_balance.children[0]
			end 
		end

		return results
	end

end 
