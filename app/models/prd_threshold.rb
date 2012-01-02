class PrdThreshold < ActiveRecord::Base
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

	def self.save_to_db( req_prd_thresholds, product_id )
		mapping_table = Hash.new
		prd_thresholds = []

		PrdThreshold.delete_all(["product_id = ? ", product_id])
		req_prd_thresholds.each do |container|

			prd_threshold = PrdThreshold.new
			prd_threshold.product_id = product_id

			if prd_threshold.save

				mapping_table[container['id']] = prd_threshold.id

				prd_threshold.parent_id = container['parent_id'].blank? ? nil: container['parent_id']
				prd_threshold.condition_id = container['condition_id'].blank? ? nil: container['condition_id']
				prd_threshold.condition_type = container['condition_type'].blank? ? "": (container['condition_type'].capitalize + "Factor")
				prd_threshold.balance_id = container['balance_id'].blank? ? nil: container['balance_id']
				prd_threshold.action_id = container['action_id'].blank? ? nil: container['action_id']

				prd_threshold.action_type = container['action_type'].blank? ? "": ("Action" + container['action_type'].capitalize)
				prd_threshold.product_id = product_id
			end

			prd_thresholds << prd_threshold
		end

		prd_thresholds.each do |container|
			if mapping_table.has_key? container['parent_id'].to_s
				container.parent_id = mapping_table[container['parent_id'].to_s]
			else
				container.parent_id = 0
			end
			container.save
		end
	end

	def self.data_to_prd_ruleset(product_id, prd_conditions)

		conditions = "product_id = " + product_id.to_s + " and (parent_id = 0 || parent_id = null)" 
		prd_thresholds_root  = PrdThreshold.find(:all, :conditions => conditions )
		results = Hash.new

		if prd_thresholds_root == nil: return  "" end 
		if prd_thresholds_root[0] == nil: return  "" end 

		leaf_nodes = prd_thresholds_root[0].leafnodes

		rule_index = 1

		leaf_nodes.each do |leafnode|
			result = Hash.new
			leafnode.self_and_ancestors.each do |node|

                debugger

				if node.condition_id != nil && node.condition_id > 0
					condition_type = node.condition_type.gsub "Factor",""
					name = 'condition_' + condition_type.downcase

                    # SHOULD BE DELETED. ONLY FOR TEST
                    #if condition_type.downcase == 'what' 
					#  value = node.condition.name
#
#                    elsif node.condition.name['option_']
#					  value = node.condition.name
#
#                    else 
#                      value = node.condition.fctr_code
#
#                   end
                   # SHOULD BE DELETED. ONLY FOR TEST

					save_conditions(prd_conditions, node.condition_id, condition_type)

				elsif node.balance_id != nil && node.balance_id > 0
					name = "balance"
					value = node.balance.name

				elsif node.action_id != nil && node.action_id > 0
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

end 
