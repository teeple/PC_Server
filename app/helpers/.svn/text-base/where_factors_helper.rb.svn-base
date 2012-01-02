module WhereFactorsHelper
	def where_countries_output
		render :partial => RULE['WhereCountry']['tmpl'], :object => @where_countries_output
	end

	def where_zones_output
		render :partial => RULE['WhereZone']['tmpl'], :object => @where_zones_output
	end

	def where_networks_output 
		render :partial => RULE['WhereNetwork']['tmpl'], :object => @where_networks_output
	end

	def where_customs_output
		returns = "[RULESET_CONDITION_WHERE_CUSTOM]\n"
		returns += @where_custom_factors_output if not @where_custom_factors_output.blank? 
		returns += "\n\n[CONDITION_WHERE_CUSTOM]\n"
		returns += @where_customs_output if not @where_customs_output.blank?
		return returns
	end

	def where_factors_output
		@where_factors_output
	end 
end
