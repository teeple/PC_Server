module BalancesHelper

	def balance_list_output
		items = []
		index = 1

		@balance_list_output.each do |name| 
			#items << index.to_s + " " + name
			items << name
			index += 1
		end 

		items.join("\n")
	end 

	def balance_counters_output
		items = []

		@balance_counters_output.each do |counter|
			items << counter
		end 

		items.join("\n")
	end 
end
