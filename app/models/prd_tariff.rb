class PrdTariff < ActiveRecord::Base
 	belongs_to :product
	belongs_to :condition, :polymorphic => true
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

	def self.save_to_db(req_prd_tariffs, product_id)

		mapping_table = Hash.new
		prd_tariffs = []

		PrdTariff.delete_all(["product_id = ? ", product_id])
		req_prd_tariffs.each do |container|

			prd_tariff = PrdTariff.new
			if prd_tariff.save
				mapping_table[container['id']] = prd_tariff.id

				prd_tariff.parent_id = container['parent_id']
				prd_tariff.condition_id = container['condition_id'].blank? ? nil : container['condition_id']
				prd_tariff.condition_type = container['condition_type'].blank? ? "" : (container['condition_type'].capitalize + "Factor")
				prd_tariff.action_id = container['action_id'].blank? ? nil : container['action_id']
				prd_tariff.action_type = container['action_type'].blank? ? "": ("Action" + container['action_type'].capitalize)
				prd_tariff.product_id = product_id
			end

			prd_tariffs << prd_tariff
		end

		prd_tariffs.each do |container|
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
		prd_tariffs_root  = PrdTariff.find(:all, :conditions => conditions )

		if prd_tariffs_root.size > 0
			leaf_nodes = prd_tariffs_root[0].leafnodes
			rule_index = 1

			results = Hash.new
			leaf_nodes.each do |leafnode|

				result = Hash.new
				leafnode.self_and_ancestors.each do |node|

					if node.condition_id !=nil && node.condition_id > 0
						condition_type = node.condition_type.downcase.gsub "factor",""
						name = 'condition_' + condition_type

						# ONLY for what condition
						if condition_type.downcase == 'what'
							value = node.condition.name
						else
							value = node.condition.fctr_code
						end

						save_conditions(prd_conditions, node.condition_id, condition_type)

					#elsif node.balance_id
					#	name = "balance"
					#	value = node.balance.name

					elsif node.action_id !=nil && node.action_id > 0
						action_type = node.action_type.downcase.gsub "action",""
						name = "action_" + action_type
						value = node.action.subfctr_name
					end 

					if name != nil && value != nil:  result[name] = value end
				end 

				if result != nil && result.size > 0 
					results['rule_' + rule_index.to_s] = result 
					rule_index += 1
				end 
			end 	
		end

		return results 
	end

end 
