module ActionDeductsHelper

	def action_deducts_output
		index = 0

		items_array = []

		@action_deducts_output.each { |k, v| 
			v.each { |v_v| 
				items = []
				v_v.each { |v_v_k, v_v_v|
					items <<  v_v_k + v_v_v
				}
				items_array << k + ": " + items.join(", ")
			}
		}

		return items_array.join("\n")
	end

end
