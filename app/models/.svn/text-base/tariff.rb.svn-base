class Tariff < ActiveRecord::Base
	has_many :action_deduct_factors,
			:dependent => :nullify
	belongs_to :unittype,
			:class_name => "CodeFactor",
			:foreign_key => "unit_type"
	belongs_to :currency_unit,
			:class_name => "CodeFactor",
			:foreign_key => "currency"

	validates_presence_of :name, :unit, :unit_type, :rate, :currency
	validates_uniqueness_of :name

	@@json_mapping_table = {
		"unit"        	=> {:value => "unit", :type => :DB_FIELD},
		"unit_type"    	=> {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "unittype" },
		"rate"          => {:value => "rate", :type => :DB_FIELD},
		"currency"      => {:value => "name", :type => :ASSOCIATION, :asso_target => :CODE_FACTOR, :asso_key => "currency_unit" }
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end

	def data_to_ruleset
		items = []

		if self.unit_type != nil : items << "unit_type = " + self.unittype.name end 
		if self.unit != nil : items << "unit = " + self.unit.to_s end 
		if self.rate != nil : items << "rate = " + self.rate.to_s end 
		if self.currency != nil : items << "currency  = " + self.currency_unit.name end 

		items.join(", ")
	end 
end
