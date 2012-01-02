class CcbsProduct < ActiveRecord::Base
  include JsonMapper

    @@json_mapping_table = {
        "SERVICE_TYPE"  => {:value => "service_type", :type => :OBJECT_FIELD},
        "PRODUCT_CODE"  => {:value => "product_code", :type => :OBJECT_FIELD},
        "PRODUCT_NAME"  => {:value => "product_name", :type => :OBJECT_FIELD},
        "DESCRIPTION"   => {:value => "description", :type => :OBJECT_FIELD},
        "BILLING_TYPE"  => {:value => "billing_type", :type => :OBJECT_FIELD},
        "START_DATE"    => {:value => "start_date", :type => :OBJECT_FIELD},
        "END_DATE"        => {:value => "end_date", :type => :OBJECT_FIELD},
        "PRODUCT_TYPE"    => {:value => "product_type", :type => :OBJECT_FIELD},
        "STATUS"          => {:value => "status", :type => :OBJECT_FIELD},
        "DEVICE_LIST"     => {:value => "device_list", :type => :OBJECT_FIELD},
        "CRTDT"            => {:value => "crtdt", :type => :OBJECT_FIELD},
        "CONDITION_LIST"  => {:value => "condition_list", :type => :OBJECT_FIELD_ORIG},
        "ITEM_LIST"       => {:value => "item_list", :type => :OBJECT_FIELD_ORIG},
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

    def make_condition_list(prd_subscriptions)

        subscriptionfee, conditions = PrdSubscription.get_subscription_fee_and_conditions(prd_subscriptions)

        ret_list = []
        conditions.each do |group_no, condition|
            condition.each do |k, factor|
                condition_group_no = 1
                factor.each do |subfactor|
                    #cs_product_condition = CsProductCondition.new
                    #cs_product_condition.save_to_db( prd_attribute, subfactor, condition_group_no)
                    element = Hash[
                        "CONDITION_TYPE"    => "PRODUCT",
                        "NAME"              => subfactor[0].upcase,
                        "VALUE"             => subfactor[2],
                        "OP_TYPE"           => subfactor[1],
                        "CONDITION_GROUP_NO"=> condition_group_no
                    ]

                    ret_list << element
                end
                condition_group_no += 1
            end
        end

        return ret_list
    end

    def make_item_list(prd_attribute,prd_additional_services, packaged_products, deposit_list)

        time  = Time.now
        time_now = time.strftime("%Y%m%d")

        product_tariff_list = []
        ret_list = []

        if not deposit_list.nil?
            deposit_list.each do |deposit_element|

                element = Hash[
                    "ITEMCOD"        =>  deposit_element['code'],
                    "ITEMNM"         =>  deposit_element['code'],
                    "IS_REQUIRED"    =>  "Y",
                    "GROUP_TYPE"     =>  "0",
                    "GROUP_NO"       =>  "0",
                    "ITEM_FLAG"      =>  "0"
                ]
                ret_list << element

                product_tariff = CcbsProductTariff.new
                product_tariff.product_code = prd_attribute.code
                product_tariff.item_code    = deposit_element['code']
                product_tariff.start_date   = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date
                product_tariff.end_date   = prd_attribute.end_date.nil? ? "" : prd_attribute.end_date
                product_tariff.method = 'M'
                product_tariff.add_unit  = "1"
                product_tariff.unit_charge   = deposit_element['value'].nil? ? "0" : deposit_element['value']
                product_tariff.validity_term  = "0"

                product_tariff_list << product_tariff
            end
        end

        if not packaged_products.nil?
            packaged_products.each { |packaged_product|
                element = Hash[
                    "ITEMCOD"        =>  packaged_product.prd_attribute.code,
                    "ITEMNM"         =>  packaged_product.prd_attribute.name,
                    "IS_REQUIRED"    =>  "N",
                    "GROUP_TYPE"     =>  "0",
                    "GROUP_NO"       =>  "0",
                    "ITEM_FLAG"      =>  "0"
                ]
                ret_list << element

                product_tariff = CcbsProductTariff.new
                product_tariff.product_code = prd_attribute.code
                product_tariff.item_code    = packaged_product.prd_attribute.code
                product_tariff.start_date   = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date
                product_tariff.end_date   = prd_attribute.end_date.nil? ? "" : prd_attribute.end_date
                product_tariff.method = 'M'
                product_tariff.add_unit  = "1"
                product_tariff.unit_charge   = packaged_product.prd_attribute.monthly_fee.nil? ? "0" : packaged_product.prd_attribute.monthly_fee
                product_tariff.validity_term  = "0"

                product_tariff_list << product_tariff
            }
        end

        if not prd_attribute.monthly_fee.nil? 

            element = Hash[
                "ITEMCOD"        =>  CODES['CCBS']['MONTHLY_FEE'].to_s,
                "ITEMNM"         =>  "MONTHLY_FEE",
                "IS_REQUIRED"    =>  "Y",
                "GROUP_TYPE"     =>  "0",
                "GROUP_NO"       =>  "0",
                "ITEM_FLAG"      =>  "0"
            ]
            ret_list << element

            product_tariff = CcbsProductTariff.new
            product_tariff.product_code = prd_attribute.code
            product_tariff.item_code    = CODES['CCBS']['MONTHLY_FEE'].to_s
            product_tariff.start_date   = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date
            product_tariff.end_date   = prd_attribute.end_date.nil? ? "" : prd_attribute.end_date
            product_tariff.method = 'M'
            product_tariff.add_unit  = "1"
            product_tariff.unit_charge   = prd_attribute.monthly_fee.nil? ? "0" : prd_attribute.monthly_fee
            product_tariff.validity_term  = "0"

            product_tariff_list << product_tariff

        end

        if not prd_attribute.subscription_fee.nil?
            element = Hash[
                "ITEMCOD"        =>  CODES['CCBS']['SUBSCRIPTION_FEE'].to_s,
                "ITEMNM"         =>  "SUBSCRIPTION_FEE",
                "IS_REQUIRED"    =>  "Y",
                "GROUP_TYPE"     =>  "0",
                "GROUP_NO"       =>  "0",
                "ITEM_FLAG"      =>  "0"
            ]
            ret_list << element

            product = prd_attribute.products[0]
            product_tariff = CcbsProductTariff.new
            product_tariff.product_code = prd_attribute.code
            product_tariff.item_code    = CODES['CCBS']['SUBSCRIPTION_FEE'].to_s
            product_tariff.start_date   = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date
            product_tariff.end_date   = prd_attribute.end_date.nil? ? "" : prd_attribute.end_date
            product_tariff.method = 'E'
            product_tariff.add_unit  = "1"
            product_tariff.unit_charge   = prd_attribute.monthly_fee.nil? ? "0" : prd_attribute.subscription_fee
            product_tariff.validity_term  = "0"

            product_tariff_list << product_tariff
        end

        prd_additional_services.each do |vas|
            if not vas.blank?
                element = Hash[
                    "ITEMCOD"        =>  vas.additional_service.code.blank? ? "": vas.additional_service.code,
                    "ITEMNM"         =>  vas.additional_service.name.blank? ? "": vas.additional_service.name,
                    "IS_REQUIRED"    =>  vas.vas_type == "REQRUIED" ? "Y" : "N",
                    "GROUP_TYPE"     =>  "0",
                    "GROUP_NO"       =>  "0",
                    "ITEM_FLAG"      =>  "1"
                ]
                ret_list << element
            end

            product = prd_attribute.products[0]
            product_tariff = CcbsProductTariff.new
            product_tariff.product_code = prd_attribute.code
            product_tariff.item_code    = vas.additional_service.code.blank? ? "": vas.additional_service.code
            product_tariff.start_date   = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date
            product_tariff.end_date   = prd_attribute.end_date.nil? ? "" : prd_attribute.end_date

            case vas.bill_cycle 
                when 'MONTHLY':
                    product_tariff.method    = 'M'
                when 'DAILY':
                    product_tariff.method    = 'A'
                else 
                    product_tariff.method    = 'E'
            end

            product_tariff.add_unit  = "1"
            product_tariff.unit_charge   = vas.rate.nil? ? "0" : vas.rate
            product_tariff.validity_term  = "0"

            product_tariff_list << product_tariff
        end

        return ret_list, product_tariff_list
    end

    ## ccbs_product에 대해서 field를 정리함
    ##
    def set_fields(prd_attribute, prd_subscriptions, prd_additional_services)

        time  = Time.now
        time_now = time.strftime("%Y%m%d")

        device_list = Array.new

        self.service_type   = prd_attribute.service_type.name
        self.product_code   = prd_attribute.code
        self.product_name   = prd_attribute.name
        self.description    = prd_attribute.description
        self.billing_type   = prd_attribute.bill_type.name
        self.start_date     = prd_attribute.start_date.nil? ? time_now: prd_attribute.start_date  
        self.end_date       = prd_attribute.end_date
        self.product_type   = prd_attribute.prd_type
        self.status         = prd_attribute.status.name

        prd_attribute.prd_attribute_devices.each do |device|
            device_list << device.code_factor.name
        end

        self.device_list    = device_list.join(',') if not device_list.nil?

        self.crtdt          = time.strftime('%Y%m%d%H%M%S')
        self.condition_list = make_condition_list(prd_subscriptions)

        deposit_list = PrdSubscription.get_deposit_list(prd_subscriptions)

        # 해당 basic product의 하위 packaged product를 가져온다.
        # 
        conditions = "prd_attribute_id = " + prd_attribute.id.to_s + " and (parent_id = 0 or parent_id = null)"
        relation_subs_root = RelationSub.find(:all, :conditions => conditions)

        packaged_products = relation_subs_root[0].leafnodes if not relation_subs_root[0].nil?

        self.item_list, tariff_list = make_item_list(prd_attribute, prd_additional_services, packaged_products, deposit_list)

        #tariff_list.each { |product_tariff| 
        #    to_ccbs_hash = mapping_to_hash(product_tariff, CcbsProductTariff.json_mapping_table)
        #    product_tariff.send_to_ccbs("POST", to_ccbs_hash.to_json)
        #}

        return tariff_list

    end

    def send_to_ccbs(method, ccbs_json)
        require 'rest-client'

        request_uri = 'http://'+CONN_REST['CCBS']['host']+':'+CONN_REST['CCBS']['port'].to_s+CONN_REST['CCBS']['url_product']

        case method
            when "GET":
            when "POST":
                #response = RestClient.post request_uri, :format => 'application/json', 
                response = RestClient.post request_uri, ccbs_json, :content_type => 'application/json'
            when "PUT":
            when "DELETE":
        end

        return response.code
    end

    def send_to_cs(prd_attribute, prd_subscriptions, prd_promotions, prd_additional_services )

        subscription_fee, conditions = PrdSubscription.get_subscription_fee_and_conditions(prd_subscriptions)

        # Product for CS 
        cs_product = CsProduct.new
        cs_product.save_to_db( prd_attribute, subscription_fee)

        # Product Conditions for CS, usually subscription conditions 
        conditions.each do |group_no, condition|
            condition.each do |k, factor|
                condition_group_no = 1
                factor.each do |subfactor|
                    cs_product_condition = CsProductCondition.new
                    cs_product_condition.save_to_db( prd_attribute, subfactor, condition_group_no)
                end
                condition_group_no += 1
            end
        end

        # Product Add Info for CS
        prd_promotions.each do |prd_promotion|
            cs_product_addinfo = CsProductAddinfo.new
            cs_product_addinfo.save_to_db(prd_attribute, prd_promotion)
        end

        # Product VAS for CS
        prd_additional_services.each do |vas|
            if not vas.blank?
                cs_product_vas = CsProductVa.new
                cs_product_vas.save_to_db( prd_attribute, vas )
            end
        end
    end

end

