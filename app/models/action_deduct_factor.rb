class ActionDeductFactor < ActiveRecord::Base
	belongs_to :action_deduct
	belongs_to :tariff
	belongs_to :uptotype,
			:class_name => "CodeFactor", :foreign_key => "upto_type"

	@@json_mapping_table = {
		"upto_start" 	=> {:value => "upto_start", :type => :DB_FIELD},
		"upto_end" 		=> {:value => "upto_end", :type => :DB_FIELD},
		"upto_type" 	=> {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "uptotype" },
		"tariff" 		=> {:value => "@tariff", :type => :HAS_CHILD_AND_DUMMY}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset
		item = Hash.new

		value = []
		op = " >= "

		if self.upto_start != nil && self.upto_start >= 0  
			value << self.upto_start 

			if self.upto_end != nil && self.upto_end > 0 
				op = " between "  
				value << self.upto_end 
			end
		end

		case self.uptotype.name.upcase
			when "SECOND":
				item['call_time'] = op + value.join(", ")

			when "MINUTE":

                temp_array = [];
                value.each do |operand|
                    temp_array << operand.to_i()*60;
                end

				item['call_time'] = op + temp_array.join(", ")

			when "HOUR": 

                temp_array = [];
                value.each do |operand|
                    temp_array << operand.to_i()*60*60;
                end

				item['call_time'] = op + value.join(", ")

			when "MONEY":
				item['used_packet'] = op + value.join(", ")

			when "PERCENT":
				item['used_packet'] = op + value.join(", ")

			when "BYTE":
				item['used_packet'] = op + value.join(", ")

			when "COUNT":
				#item['cnt_deduct'] = op + value.join(", ")
		end 

		if self.tariff 
			item['rate_name'] = "=" + self.tariff.name
		else 
			item = Hash.new
		end

		return item
	end 
end

