class PrdAttribute < ActiveRecord::Base
	has_many :prd_attribute_devices,
			:dependent => :destroy
	has_many :products,
			:dependent => :destroy
	has_many :packaged_product,
			:class_name => "RelationSubscription",
            :foreign_key => 'basic_product_id'
    belongs_to :service_type,
            :class_name => "CodeFactor",
            :foreign_key => "service_type_id"
    belongs_to :bill_type,
            :class_name => "CodeFactor",
            :foreign_key => "bill_type_id"
    belongs_to :status,
            :class_name => "CodeFactor",
            :foreign_key => "status_id"

	#validates_presence_of :code, :name, :status, :prd_type, :bill_type
	#validates_uniqueness_of  :code, :name
	#validates_size_of :code, :is => 2
	#validates_inclusion_of :prd_type, :in => %w( basic optional promotional packaged )
	#validates_inclusion_of :bill_type, :in => %w( PPS POSTPAID HYBRID )

	@@json_mapping_table = {
		"id"               => {:value => "id", :type => :DB_FIELD},
		"code"             => {:value => "code", :type => :DB_FIELD},
		"name"             => {:value => "name", :type => :DB_FIELD},
		"rollover"         => {:value => "rollover", :type => :DB_FIELD},
		"description"      => {:value => "description", :type => :DB_FIELD},
		"status"           => {:value => "status_id", :type => :DB_FIELD},
		"prd_type"         => {:value => "prd_type", :type => :DB_FIELD},
		"bill_type"        => {:value => "bill_type_id", :type => :DB_FIELD},
		"service_type"     => {:value => "service_type_id", :type => :DB_FIELD},
		"devices"          => {:value => "@prd_attribute_devices", :type => :HAS_CHILD_MULTI},
		"ref_products"     => {:value => "ref_products", :type => :DB_FIELD_MODIFIED_ARRAY_ID},
		"products"     	   => {:value => "id", :type => :HAS_CHILD_MULTI_PRODUCT},
		"start_date"       => {:value => "start_date", :type => :DB_FIELD},
		"end_date"     	   => {:value => "end_date", :type => :DB_FIELD},
		"monthly_fee"      => {:value => "monthly_fee", :type => :DB_FIELD},
		"subscription_fee" => {:value => "subscription_fee", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		@@json_mapping_table
	end 

	def mapping_and_save(req_prd_attribute, product_id)

		self.name = req_prd_attribute['name']
		self.code = req_prd_attribute['code']
		self.prd_type = req_prd_attribute['prd_type']
		self.description = req_prd_attribute['description']
		self.bill_type = req_prd_attribute['bill_type']
		self.status = req_prd_attribute['status']
		self.save!

		if not req_prd_attribute['devices'].blank?
			req_prd_attribute['devices'].each do |device|
				prd_attribute_device = PrdAttributeDevice.new
				prd_attribute_device.code_factor_id = device
				prd_attribute_device.prd_attribute_id = self.id
				prd_attribute_device.save!
			end
		end
	end 

	def data_to_ruleset_list
		returns = nil

		product_list = self.ref_products
        product = self.products[0]

		#if (not self.ref_products.blank?) && (self.ref_products.size > 1)
		#	self.ref_products.each do |product_id|
		#		temp_list = PrdAttribute.find(:all, :conditions => ["product_id = ? and prd_attribute_id = ?", product_id, products[0].prd_attribute_id])
		#	end
		#end

		if not self.blank?
			if (not self.blank?) && (not self.code.blank? )

				product_name = self.name.downcase.gsub " ", "_"
				returns = sprintf("%s : product_code = '%s', service_type = '%s', bill_type = '%s' ", product_name, self.code, self.service_type.name, self.bill_type.name)
			end
		end
	end
end

