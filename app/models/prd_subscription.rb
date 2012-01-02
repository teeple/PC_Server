class PrdSubscription < ActiveRecord::Base
    ActiveRecord::Base.lock_optimistically = false

	belongs_to :product
	belongs_to :condition, :polymorphic => true 
	belongs_to :balance
	belongs_to :action, :polymorphic => true 
	acts_as_tree :order => "id"

	#validates_presence_of :product_id

	@@json_mapping_table = {
	 "id"               => {:value => "id", :type => :DB_FIELD},
	 "parent_id"        => {:value => "parent_id", :type => :DB_FIELD},
	 "condition_id"     => {:value => "condition_id", :type => :DB_FIELD},
	 "condition_name"   => {:value => "condition.name", :type => :EVAL},
	 "condition_type"   => {:value => "condition_type", :type => :DB_FIELD_MODIFIED, :act => {:operation => :DELETE, :params => "Factor"}},
	 "condition_uri"    => {:value => "", :type => :TITLE},
	 "balance_id"       => {:value => "balance_id", :type => :DB_FIELD},
	 "balance_name"     => {:value => "balance.name", :type => :EVAL},
	 "balance_uri"      => {:value => "", :type => :DB_FIELD},
	 "action_id"        => {:value => "action_id", :type => :DB_FIELD},
	 "action_name"      => {:value => "action.subfctr_name", :type => :EVAL},
	 "action_type"      => {:value => "action_type", :type => :DB_FIELD_MODIFIED, :act => {:operation => :DELETE, :params => "Action"}},
	 "action_uri"       => {:value => "", :type => :TITLE}
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

	def self.save_to_db( req_prd_subscriptions, product_id )
		mapping_table = Hash.new
		prd_subscriptions = []

		PrdSubscription.delete_all(["product_id = ? ", product_id])
		req_prd_subscriptions.each do |container|

			prd_subscription = PrdSubscription.new
			prd_subscription.product_id = product_id

			if prd_subscription.save

				mapping_table[container['id']] = prd_subscription.id

				prd_subscription.parent_id = container['parent_id'].blank? ? nil: container['parent_id']
				prd_subscription.condition_id = container['condition_id'].blank? ? nil: container['condition_id']
				prd_subscription.condition_type = container['condition_type'].blank? ? "": (container['condition_type'].capitalize + "Factor")
				prd_subscription.balance_id = container['balance_id'].blank? ? nil: container['balance_id']
				prd_subscription.action_id = container['action_id'].blank? ? nil: container['action_id']

				prd_subscription.action_type = container['action_type'].blank? ? "": ("Action" + container['action_type'].capitalize)
				prd_subscription.product_id = product_id
			end

			prd_subscriptions << prd_subscription
		end

		prd_subscriptions.each do |container|
			if mapping_table.has_key? container['parent_id'].to_s
				container.parent_id = mapping_table[container['parent_id'].to_s]
			else
				container.parent_id = 0
			end
			container.save
		end
	end

	def self.data_to_prd_ruleset(product_id, prd_conditions)

		conditions = "product_id = " + product_id.to_s + " and parent_id = 0" 
		prd_subscriptions_root  = PrdSubscription.find(:all, :conditions => conditions )
		results = Hash.new

		if prd_subscriptions_root == nil: return  "" end 
		if prd_subscriptions_root[0] == nil: return  "" end 

		leaf_nodes = prd_subscriptions_root[0].leafnodes

		rule_index = 1

		leaf_nodes.each do |leafnode|
			result = Hash.new
			leafnode.self_and_ancestors.each do |node|

				if node.condition_id !=nil && node.condition_id > 0
					condition_type = node.condition_type.gsub "Factor",""
					name = 'condition_' + condition_type.downcase

                    # SHOULD BE DELETED. ONLY FOR TEST
                    if condition_type.downcase == 'what' 
					  value = node.condition.name

                    elsif node.condition.name['option_']
					  value = node.condition.name

                    else 
                      value = node.condition.fctr_code

                    end
                    # SHOULD BE DELETED. ONLY FOR TEST

					save_conditions(prd_conditions, node.condition_id, condition_type)

				elsif node.balance_id !=nil && node.balance_id > 0
					name = "balance"
					value = node.balance.name

				elsif node.action_id !=nil && node.action_id > 0
					action_type = node.action_type.gsub "Action",""
					name = "action_" + action_type.downcase 
					value = node.action.subfctr_name
				end 

				if name != nil && value != nil:  result[name] = value end
			end 

			if result != nil && result.size > 0
				results['rule_' + rule_index.to_s] = result 
				rule_index += 1
			end 
		end

		return results 
	end

    def self.get_conditions(prd_subscriptions)
    end

	def self.get_subscription_fee_and_conditions(prd_subscriptions)
		founded = PrdSubscription.new
		exist_subscribe = 0

		prd_subscriptions.each do |prd_subscription|
			if prd_subscription.condition_id != nil && prd_subscription.condition_id > 0
				if prd_subscription.condition.code_factor.name == 'PC_SUBSCRIBE'
					exist_subscribe = 1
					founded = prd_subscription 
					break
				end
			end  # if  
		end  # main each 

		conditions = Hash.new
		group_no = 0 
		is_founded = 0 
		fee = 0

		if exist_subscribe == 1

			founded.leafnodes.each do |leafnode|
				group_no += 1
				leafnode.self_and_ancestors.each do |node|

					if node.condition_id != nil && node.condition_id > 0 && node.condition_type != "WhatFactor"
						conditions[group_no] = node.condition.subfactors
					end

					if is_founded != 1 && node.action_id != nil && node.action_id > 0 && node.action_type == "ActionDeduct" && node.action.action_deduct_factors[0].tariff.rate > 0 
						is_founded = 1
						fee = node.action.action_deduct_factors[0].tariff.rate
					end # if
				end 
			end  # each sub 
		end

		return fee, conditions 
	end  # function end

    def self.get_deposit_list(prd_subscriptions)

        deposit_list = Array.new

        prd_subscriptions.each do |prd_subscription|
            if prd_subscription.condition_id != nil && prd_subscription.condition_id > 0
                if prd_subscription.condition.code_factor.name == 'PC_DEPOSIT'

                    deposit_element = Hash.new

                    what_custom_factors = prd_subscription.condition.what_custom.what_custom_factors

                    what_custom_factors.each do |factor|
                        if factor.name == 'AMOUNT'
                            deposit_element['value'] = factor.value

                        elsif factor.name = 'DEP_CODE'
                            deposit_element['code'] = factor.value
                        end

                    end

                    if not deposit_element.nil? 
                        debugger
                        deposit_list << deposit_element
                    end
                end 

            end
        end

        return deposit_list
    end
end 
