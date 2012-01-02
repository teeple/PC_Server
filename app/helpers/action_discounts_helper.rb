module ActionDiscountsHelper
	def action_discounts_output
		index = 0

		items_array = Array.new

		@action_discounts_output.each { |k,v|

			item_array = Array.new
			v.each do |v_k, v_v|
				item_array << v_k + "= " + v_v
			end 
			items_array[index] = k + ": " +  item_array.join(", ")
			index += 1
		} 

		return items_array.join("\n")
	end
end
