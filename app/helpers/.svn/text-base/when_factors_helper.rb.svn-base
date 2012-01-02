module WhenFactorsHelper

	def when_durations_output
		render :partial => RULE['WhenDuration']['tmpl'], :object => @when_durations_output
	end

	def when_weeks_output
		render :partial => RULE['WhenWeek']['tmpl'], :object => @when_weeks_output
	end

	def when_timeslots_output
		render :partial => RULE['WhenTimeslot']['tmpl'], :object => @when_timeslots_output
	end

	def when_days_output
		render :partial => RULE['WhenDay']['tmpl'], :object => @when_days_output
	end

	def when_customs_output
		returns = "[RULESET_CONDITION_WHEN_CUSTOM]\n"
		returns += @when_custom_factors_output if not @when_custom_factors_output.blank?
		returns += "\n\n[CONDITION_WHEN_CUSTOM]\n"
		returns += @when_customs_output if not @when_customs_output.blank?
		return returns
	end

	def when_factors_output 
		@when_factors_output
	end 
end

