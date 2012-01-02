class AdditionalService < ActiveRecord::Base
	has_many :prd_additional_services,
			:dependent => :nullify
	belongs_to :currency_factor,
			:class_name => "CodeFactor",
			:foreign_key => "currency_factor_id"

	validates_presence_of :name, :vas_type, :rate, :currency_factor_id, :code
	validates_uniqueness_of :name, :code

	@@json_mapping_table = {
		"id"               => {:value => "id", :type => :DB_FIELD},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"code"             => {:value => "code", :type => :DB_FIELD},
		"rate"             => {:value => "rate", :type => :DB_FIELD},
		"currency"         => {:value => "currency_factor_id", :type => :DB_FIELD},
		"description"  		=> {:value => "description", :type => :DB_FIELD},
		"vas_type"  		=> {:value => "vas_type", :type => :DB_FIELD},
		"bill_cycle"  		=> {:value => "bill_cycle", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end