module ActionCustomsHelper
	def action_customs_output
		index = 0

		items_array = []

		@action_customs_output.each { |k, v| 
			items_array << k + ": " + v.join(", ")
		}

		return items_array.join("\n")
	end
end
