class Product < ActiveRecord::Base
	belongs_to :prd_attribute 
	has_many :prd_members, 
			:dependent => :destroy
	has_many :prd_subscriptions, 
			:dependent => :destroy
	has_many :prd_tariffs, 
			:dependent => :destroy
	has_many :prd_balances,
			:dependent => :destroy,
			:include => [:prd_balance_conditions]
	has_many :prd_thresholds, 
			:dependent => :destroy
	has_many :prd_promotions,
			:dependent => :destroy,
			:include => [:prd_promotion_factors, :prd_promotion_rules]
	has_many :prd_additional_services,
			:dependent => :destroy,
			:include => [:additional_service]

	@@json_mapping_table = {
		"prd_attribute"    => {:value => "@prd_attribute", :type => :HAS_CHILD},
		"prd_members"      => {:value => "@prd_members", :type => :HAS_CHILD_MULTI},
		"prd_subscriptions" => {:value => "@prd_subscriptions", :type => :HAS_CHILD_MULTI},
		"prd_tariffs"      => {:value => "@prd_tariffs", :type => :HAS_CHILD_MULTI},
		"prd_balances"     => {:value => "@prd_balances", :type => :HAS_CHILD_MULTI},
		"prd_thresholds"   => {:value => "@prd_thresholds", :type => :HAS_CHILD_MULTI},
		"prd_promotions"   => {:value => "@prd_promotions", :type => :HAS_CHILD_MULTI},
		"prd_additional_services"  => {:value => "@prd_additional_services", :type => :HAS_CHILD_MULTI}
	}

	@@json_mapping_table_id = {
		"product_id"			=> {:value => "id", :type => :DB_FIELD}
	}

	def self.json_mapping_table
		return @@json_mapping_table
	end 

	def self.json_mapping_table_id 
		return @@json_mapping_table_id
	end

    # 해당 product에 대한 rule을 삭제한다.
    #
    def delete_rules()

        product_name = @prd_attribute.name.downcase.gsub " ","_"
        product_code = @prd_attribute.code

        # delete product_basic_aaa.rule 
        #    
        @prd_attribute = @product.prd_attribute
        file_name = RULE_PATH + sprintf(RULE["Product"]["rule"], @prd_attribute.prd_type.downcase, product_name)
        File.delete(file_name) if File.exist?(file_name)

        # delete in charging_account.rule
        #    
        new_file_name = RULE_PATH+RULE["Balance"]["rule"]
        org_file_name = RULE_PATH+RULE["Balance"]["rule"] + '.bak'
        File.rename(new_file_name, org_file_name)
        matching_option = "[' =']" + product_name +"[' ,']"
        file = File.new(new_file_name)
        File.open(org_file_name).each { |line|
            file.puts(line) unless line.match(matching_option)
        }

        # delete in product_list.rule
        #
        new_file_name = TMPL_PATH + RULE['PrdAttribute']['tmpl_list']
        org_file_name = TMPL_PATH + RULE['PrdAttribute']['tmpl_list'] + '.bak'
        File.rename(new_file_name, org_file_name)

        matching_option = "product_code = '"+product_code+"'"
        file = File.new(new_file_name)
        File.open(org_file_name).each { |line|
            file.puts(line) unless line.match(matching_option)
        }
    end

    # default condition을 저장한다
    #
    def set_default_conditions(prd_attribute, product)

        service_type = prd_attribute.service_type

        component_types = Hash.new
        Code.find(11).code_factors.each {|code|
            component_types[code.id] = code.name
        }

        component_types.each { |key, value|

            who_factors = WhoFactor.find(:all, 
                :conditions => {:default_flag => 'YES', 
                        :target => key, :service_type => service_type})
            what_factors = WhatFactor.find(:all, 
                :conditions => {:default_flag => 'YES', 
                        :target => key, :service_type => service_type})
            when_factors = WhenFactor.find(:all, 
                :conditions => {:default_flag => 'YES', 
                        :target => key, :service_type => service_type})
            where_factors = WhereFactor.find(:all, 
                :conditions => {:default_flag => 'YES', 
                        :target => key, :service_type => service_type})

            case value.upcase 
                when 'SUBSCRIPTION':
                    prd_subscription = PrdSubscription.new
                    prd_subscription.product_id = product.id
                    prd_subscription.parent_id = 0
                    prd_subscription.save!

                    make_child_conditions(who_factors, what_factors, when_factors, where_factors, prd_subscription,product)

                when 'TARIFF':
                    prd_tariff = PrdTariff.new
                    prd_tariff.product_id = product.id
                    prd_tariff.parent_id  = 0 # make is as root 
                    prd_tariff.save!

                    make_child_conditions(who_factors, what_factors, when_factors, where_factors, prd_tariff,product)

                when 'BALANCE':
                    prd_balance = PrdBalance.new
                    prd_balance.product_id = product.id
                    prd_balance.parent_id = 0
                    prd_balance.save!

                    make_child_conditions(who_factors, what_factors, when_factors, where_factors, prd_balance,product)

                when 'THRESHOLD':
                    prd_threshold = PrdThreshold.new
                    prd_threshold.product_id = product.id
                    prd_threshold.parent_id = 0
                    prd_threshold.save!

                    make_child_conditions(who_factors, what_factors, when_factors, where_factors, prd_threshold,product)
            end
        }
    end 

    # default condition에 해당하는 sub conditions들을 확인한다
    #
    def make_child_conditions(who_factors, what_factors, when_factors, where_factors, object,product)

        who_factors.each { |who_factor|
            child = object.children.create(:condition_id => who_factor.id, :condition_type => 'WhoFactor', :product_id => product.id)
            child.save!
        }
        what_factors.each { |what_factor|
            child = object.children.create(:condition_id => what_factor.id, :condition_type => 'WhatFactor', :product_id => product.id)
           child.save!
        }
        when_factors.each { |when_factor|
            child = object.children.create(:condition_id => when_factor.id, :condition_type => 'WhenFactor', :product_id => product.id)
            child.save!
        }
        where_factors.each { |where_factor|
            child = object.children.create(:condition_id => where_factor.id, :condition_type => 'WhereFactor', :product_id => product.id)
            child.save!
        }
    end

    # data to ruleset 으로 바꿈
    #
    def data_to_ruleset_list

		returns = nil
		if not self.blank?
			if (not self.prd_attribute.blank?) && (not self.prd_attribute.code.blank?)
				product_name = self.prd_attribute.name.downcase.gsub " ", "_"
				returns = sprintf("%s : product_code = '%s' , in_service = 'CCF'", product_name, self.prd_attribute.code, self.prd_attribute.name)
			end
		end

		returns 
	end
end

