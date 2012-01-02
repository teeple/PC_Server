class CcbsBundleProduct < ActiveRecord::Base
    include JsonMapper

    @@json_mapping_table = {
        "CODE"          => {:value => "code", :type => :OBJECT_FIELD},
        "NAME"          => {:value => "name", :type => :OBJECT_FIELD},
        "START_DATE"    => {:value => "start_date", :type => :OBJECT_FIELD},
        "END_DATE"      => {:value => "end_date", :type => :OBJECT_FIELD},
        "PRODUCT_TYPE"  => {:value => "product_type", :type => :OBJECT_FIELD},
        "STATUS"        => {:value => "status", :type => :OBJECT_FIELD},
        "CRTDT"         => {:value => "crtdt", :type => :OBJECT_FIELD},
        "PACKAGE_PRODUCT_LIST" => {:value => "packaged_product_list", :type => :OBJECT_FIELD_ORIG}
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

    def set_fields(prd_attribute)

        time = Time.now
        time_now = time.strftime("%Y%m%d")

        self.code = prd_attribute.code
        self.name = prd_attribute.name

        if not prd_attribute.start_date.nil? 
            formed_date = prd_attribute.start_date.to_s.gsub "-", ""
        end
        self.start_date = prd_attribute.start_date.nil? ? time_now: formed_date

        if not prd_attribute.end_date.nil? 
            formed_date = prd_attribute.end_date.to_s.gsub "-", ""
        end
        self.end_date = prd_attribute.end_date.nil? ? time_now: formed_date
        self.product_type = prd_attribute.prd_type
        self.status     = prd_attribute.status.name
        self.crtdt      = time.strftime('%Y%m%d%H%M%S')

        packaged_product_list = []
        product_list = Hash.new

        service_type = Code.find(10, :include => :code_factors)
        service_type.code_factors.each do |type|
            product_list[type.name] = Array.new
        end

        ref_products = prd_attribute.ref_products.split(',')
        ref_products.each do |prd_attribute_id|
            prd_attribute = PrdAttribute.find(prd_attribute_id)
            element = Hash[
                "PRODUCT_CODE" => prd_attribute.code,
                "PRODUCT_VK_CNT" => "1"
            ]

            product_list[prd_attribute.service_type.name] << element 
        end

        service_type.code_factors.each do |type|

            if (not product_list[type.name].nil?) && (product_list[type.name].length > 0)
                element = Hash[
                    "SERVICE_TYPE" => type.name,
                    "SERVICE_VK_CNT" => "3",
                    "PRODUCTS" => product_list[type.name]
                ]
                packaged_product_list << element 
            end
        end

        self.packaged_product_list = packaged_product_list

    end 

    def send_to_ccbs(method, ccbs_json)
        require 'rest-client'

        request_uri = 'http://'+CONN_REST['CCBS']['host']+':'+CONN_REST['CCBS']['port'].to_s+CONN_REST['CCBS']['url_bundle_product']

        case method

            when 'GET':
            when 'POST':
                response = RestClient.post request_uri, ccbs_json, :content_type => 'application/json'
            when 'PUT':
            when 'DELETE':
        end

        return response.code

    end
end
