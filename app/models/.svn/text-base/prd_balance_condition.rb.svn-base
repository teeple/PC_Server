class PrdBalanceCondition < ActiveRecord::Base
	belongs_to :prd_balance
	acts_as_tree :order => "id"
	belongs_to :condition, :polymorphic => true

	#validates_presence_of :prd_balance_id

	@@json_mapping_table = {
	 "id"               => {:value => "id", :type => :DB_FIELD},
	 "parent_id"        => {:value => "parent_id", :type => :DB_FIELD},
	 "condition_id"     => {:value => "condition_id", :type => :DB_FIELD},
	 "name"             => {:value => "name", :type => :ASSOCIATION, :asso_target => :CONDITION},
	 "type"             => {:value => "condition_type", :type => :DB_FIELD_MODIFIED, :act => {:operation => :DELETE, :params => "Factor" }},
	 "uri"              => {:value => "", :type => :TITLE}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

end
