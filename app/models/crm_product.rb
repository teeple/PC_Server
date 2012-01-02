class CrmProduct < ActiveRecord::Base
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
      "DEVICE_LIST"     => {:value => "device_list", :type => :OBJECT_FIELD}
  }

    def self.json_mapping_table
      return @@json_mapping_table
    end

    def set_fields(prd_attribute)

        device_list = []

        time  = Time.now
        time_now = time.strftime("%Y-%m-%d")

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

            debugger
            if not device.code_factor.name.nil? 
                device_list << device.code_factor.name
            end
        end

        self.device_list    = device_list.join(',') if not device_list.nil? 
    end

    def send_to_crm(method, crm_json)
      require 'rest-client'

      request_uri = 'http://'+CONN_REST['CRM']['host']+':'+CONN_REST['CRM']['port'].to_s+CONN_REST['CRM']['url_product']

      case method
          when "GET":
          when "POST":
            #response = RestClient.post request_uri, :format => 'application/json', 

            response = RestClient.post request_uri, crm_json, :content_type => 'application/json'

          when "PUT":
          when "DELETE":
      end

      return response.code
    end
end

