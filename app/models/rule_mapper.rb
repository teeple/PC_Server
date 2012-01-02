module RuleMapper

	class RuleMappingTable
		@@rule_mapping_table  = Hash.new
	end

	def mapping_to_hash(object, mapping_table)

		returns_hash = Hash.new
		temp_hash = Hash.new
		mapping_table.each do |k, v|

			if (not object.blank?) || (v[:value][0] == 64)  || (v[:type] == :HAS_CHILD_MULTI_AND_SELF) # @ == 64
				case v[:type]
					when :TITLE:
						returns_hash[k] = v[:value]

					when :DB_FIELD:
						returns_hash[k] = object[v[:value]].blank? ? "": object[v[:value]].to_s
					when :DB_FIELD_MODIFIED:

						if object[v[:value]].blank? 
							returns_hash[k] = ""
						else 
							case v[:act][:operation]
								when :DELETE:
									returns_hash[k] = (object[v[:value]].sub v[:act][:params], "")
								else
									returns_hash[k] = ""
							end
						end 
						
					when :FOREIGN_DB_FIELD: # similar to refering others but located in self 
						returns_hash[k] = object

					when :HAS_CHILD: # refer to others using foreign key 
						object_of_fkey = object.instance_variable_get(v[:value])

						if object_of_fkey.blank?
							class_name = ""
							temp_array = (v[:value].delete "@").split('_')
							temp_array.each do |node|
								class_name += node.capitalize
							end 
							returns_hash[k] = mapping_to_hash(nil, eval(class_name).rule_mapping_table)
						else
							returns_hash[k] = mapping_to_hash(object_of_fkey, object_of_fkey.class.rule_mapping_table)
						end

					when :HAS_CHILD_MULTI: # refer to others using foreign key 
						object_of_fkey = object.instance_variable_get(v[:value])

						if object_of_fkey.blank?

							main_array = []
							class_name = ""
							temp_array = (v[:value].delete "@").split('_')
							temp_array.each do |node|
								class_name += node.capitalize.singularize
							end 
							main_array  << mapping_to_hash(nil, eval(class_name).rule_mapping_table)
							returns_hash[k] = main_array

						else
							temp_array = []
							object_of_fkey.each do |node|
								temp_array << mapping_to_hash(node, node.class.rule_mapping_table)
							end

							returns_hash[k] = temp_array
						end

					when :HAS_CHILD_MULTI_AND_DUMMY:

						temp_array = []	
						object_of_fkey = object.instance_variable_get(v[:value])

						if not object_of_fkey.blank?
							object_of_fkey.each do |c|
								temp_array << mapping_to_hash(c, c.class.rule_mapping_table)
							end 
						end
						returns_hash[k] = temp_array

					when :HAS_CHILD_AND_DUMMY: # refer to others using foreign key, but self is dummy 
						temp_hash = Hash.new

						object_of_fkey  = object.instance_variable_get(v[:value])
						if not object_of_fkey.blank?
							temp_hash = mapping_to_hash(object_of_fkey, object_of_fkey.class.rule_mapping_table)
						end

					when :HAS_CHILD_AND_SELF: # similar to refering other but located in self 
						returns_hash[k] = mapping_to_hash(object, RuleMappingTable.mapping_table[v[:value]])
				
					when :HAS_CHILD_MULTI_AND_SELF: # similar to refering others but located in self 
						temp_array = []
						temp_hash = Hash.new
						temp_hash = mapping_to_hash(object, RuleMappingTable.mapping_table[v[:value]])
					    temp_hash.each do |c|
							temp_array << Hash[*c.flatten]
						end 
						returns_hash[k] = temp_array

					when :ASSOCIATION:

						case v[:asso_target]
							when :CONDITION:
								if object.condition_id.blank? || object.condition_id == 0
									returns_hash[k]  = ""
								else
									returns_hash[k]  = object.condition.blank? ? "": object.condition[v[:value]]
								end

							when :ACTION:
								if object.action_id.blank? || object.action_id == 0
									returns_hash[k]  = ""
								else
									returns_hash[k]  = object.action.blank? ? "": object.action[v[:value]]
								end 	

							when :BALANCE:
								returns_hash[k] = object.balance.blank? ? "": object.balance[v[:value]]
							when :TARIFF:
								returns_hash[k] = object.tariff.blank? ? "": object.tariff[v[:value]]

							when :CODE_FACTOR:
								case v[:asso_key]
									when "unittype":
										if object.unittype.blank?
											returns_hash[k] = ""
										else
											returns_hash[k] = object.unittype.name.blank? ? "": object.unittype.name
										end

									when "currency_unit":
										if object.currency_unit.blank?
											returns_hash[k] = ""
										else
											returns_hash[k] = object.currency_unit.name.blank? ? "": object.currency_unit.name
										end

									when "uptotype":
										if object.uptotype.blank?
											returns_hash[k] = ""
										else
											returns_hash[k] = object.uptotype.name.blank? ? "": object.uptotype.name
										end 

									when "user_class_type":
										if object.user_class_type.blank?
											returns_hash[k] = ""
										else
											returns_hash[k] = object.user_class_type.name.blank? ? "": object.user_class_type.name
										end 

									when "user_role_type":
										if object.user_role_type.blank?
											returns_hash[k] = ""	
										else
											returns_hash[k] = object.user_role_type.name.blank? ? "": object.user_role_type.name
										end
								end
						 end
					end # end of case control
			else 
				returns_hash[k] = ""
			end 
		end  #end of each control

		if not temp_hash.blank? && temp_hash.size > 0 
			returns_hash.merge! temp_hash
		end

		return returns_hash 
	end
end
