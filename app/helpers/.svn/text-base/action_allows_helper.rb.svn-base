module ActionAllowsHelper

	def action_allows_output
		index = 0

		items_array = Array.new
		@action_allows_output.each { |k,v|

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
