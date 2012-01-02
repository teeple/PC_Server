module ProductsHelper

	def product_type
		@prd_attribute.prd_type.upcase 
	end

	def product_name 
		@prd_attribute.name.upcase.gsub " ","_"
	end

	def prd_subscriptions_output 

		index=0
		items_array = Array.new

		@prd_subscriptions_output.each { |k,v| 

			item_array = Array.new 
			i=0
			v.each { |v_k, v_v|
				item_array[i] = v_k + "=" + v_v 
				i += 1
			}
			items_array[index] = k + ": " + item_array.join(", ")
			index +=1
		}

		return items_array.join("\n")
	end 

	def prd_thresholds_output 

		index=0
		items_array = Array.new

		@prd_thresholds_output.each { |k,v| 

			item_array = Array.new 
			i=0
			v.each { |v_k, v_v|
				item_array[i] = v_k + "=" + v_v 
				i += 1
			}
			items_array[index] = k + ": " + item_array.join(", ")
			index +=1
		}

		return items_array.join("\n")
    end
	
	def prd_tariffs_output 
		index=0
		items_array = Array.new

		@prd_tariffs_output.each { |k,v| 

			item_array = Array.new 
			i=0
			v.each { |v_k, v_v|
				item_array[i] = v_k + "=" + v_v 
				i += 1
			}
			items_array[index] = k + ": " + item_array.join(", ")
			index +=1
		}

		return items_array.join("\n")
	end 

	def prd_additional_services_output
		index=0
		items_array = Array.new

		@prd_additional_services_output.each { |k,v| 

			item_array = Array.new 
			i=0
			v.each { |v_k, v_v|
				item_array[i] = v_k + "= '" + v_v  + "'"
				i += 1
			}
			items_array[index] = k + ": " + item_array.join(", ")
			index +=1
		}

		return items_array.join("\n")
	end 

	def prd_balances_output 
        return @prd_balances_output
	end 

	def prd_promotions_output 
		index=0
		items_array = Array.new

		@prd_promotions_output.each { |k,v| 

			item_array = Array.new 
			i=0
			v.each { |v_k, v_v|
				item_array[i] = v_k + "=" + v_v 
				i += 1
			}
			items_array[index] = k + ": " + item_array.join(", ")
			index +=1
		}

		return items_array.join("\n")
	end 

end
