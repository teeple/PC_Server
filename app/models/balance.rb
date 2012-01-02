class Balance < ActiveRecord::Base
	has_many :prd_subscription,
			:dependent => :nullify
	has_many :prd_balance,
			:dependent => :nullify

	validates_presence_of :name, :canbe_promotional, :balance_type, :scale, :code
	validates_uniqueness_of :name, :code
	validates_inclusion_of :canbe_promotional, :in => %w(NONE TRUE FALSE)
	validates_inclusion_of :balance_type, :in => %w( MONEY TIME COUNT)
	validates_inclusion_of :scale, :in => 1..10000

	@@json_mapping_table = {
		"view_name"      	=> {:value => "BALANCE", :type => :TITLE},
		"name"				=> {:value => "name", :type => :DB_FIELD},
		"code"				=> {:value => "code", :type => :DB_FIELD},
		"id"				=> {:value => "id", :type => :DB_FIELD},
		"description"      	=> {:value => "description", :type => :DB_FIELD},
		"balance_type"     	=> {:value => "balance_type", :type => :DB_FIELD},
		"type"     	        => {:value => "type", :type => :DB_FIELD},
		"free_charged"     	=> {:value => "free_charged", :type => :DB_FIELD},
		"reset_cycle"     	=> {:value => "reset_cycle", :type => :DB_FIELD},
		"expire_date"     	=> {:value => "expire_date", :type => :DB_FIELD},
		"charging_target"   => {:value => "charging_target", :type => :DB_FIELD},
		"canbe_promotional"	=> {:value => "canbe_promotional", :type => :DB_FIELD},
		"scale"         	=> {:value => "scale", :type => :DB_FIELD},
		"view_balance_type"	=> {:value => "BALANCE TYPE", :type => :TITLE},
		"view_canbe_promotional"         => {:value => "Used for Promotion", :type => :TITLE},
		"view_scale"       	=> {:value => "Scale for Calculation", :type => :TITLE}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def data_to_ruleset_counter 

		items = []
		# items << self.id.to_s + self.suffix.to_s
		items << self.id.to_s

		case self.balance_type.upcase
			when 'MONEY':
				items << "1"
			when 'TIME':
				items << "4" 
			when 'COUNT':
				items << "2"
			when 'BYTE':
				items << "3"
			else
				items << "99"
		end

		items << self.code
		items << self.scale.to_s

		if not self.description.blank? 
			temp = self.description.gsub " ", ""
			items << temp
		end

		items.join("\t")
	end 
end

