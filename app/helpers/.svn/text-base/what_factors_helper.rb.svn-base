module WhatFactorsHelper
	def qos_output
		render :partial => RULE['WhatQo']['tmpl'] , :object => @what_qos_output
	end

	def urlgroups_output
		render :partial => RULE['WhatUrlgroup']['tmpl'], :object => @what_urlgroups_output
	end

	def what_customs_output
		returns = "[RULESET_CONDITION_WHAT_CUSTOM]\n"
		returns += @what_custom_factors_output if not @what_custom_factors_output.blank? 
		returns += "\n\n[CONDITION_WHAT_CUSTOM]\n"
		returns += @what_customs_output if not @what_customs_output.blank? 
		return returns
	end

	def what_factors_output
		@what_factors_output
	end 
end
