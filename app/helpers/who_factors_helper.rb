module WhoFactorsHelper
	def member_output
		render :partial => RULE['WhoMember']['tmpl'],  :object => @who_members_output
	end

	def numbers_output
		render :partial => RULE['WhoNumber']['tmpl'], :object => @who_numbers_output
	end

	def prefixes_output
		render :partial => RULE['WhoPrefix']['tmpl'], :object => @who_prefixes_output
	end

	def countries_output
		render :partial => RULE['WhoCountry']['tmpl'], :object => @who_countries_output
	end

	def customs_output
		returns = "[RULESET_CONDITION_WHO_CUSTOM]\n"
		returns += @who_custom_factors_output if not @who_custom_factors_output.blank? 
		returns += "\n\n[CONDITION_WHO_CUSTOM]\n"
		returns += @who_customs_output if not @who_customs_output.blank? 
		return returns
	end

	def who_factors_output
		@who_factors_output
	end 
end
