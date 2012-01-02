class CcbsProductTariff < ActiveRecord::Base

    @@json_mapping_table = {
        "PRODUCT_CODE"  => {:value => "product_code", :type => :OBJECT_FIELD},
        "ITEMCOD"       => {:value => "item_code", :type => :OBJECT_FIELD},
        "FROMDT"        => {:value => "start_date", :type => :OBJECT_FIELD},
        "TODT"          => {:value => "end_date", :type => :OBJECT_FIELD},
        "METHOD"        => {:value => "method", :type => :OBJECT_FIELD},
        "ADDUNIT"       => {:value => "add_unit", :type => :OBJECT_FIELD},
        "UNITCHARGE"    => {:value => "unit_charge", :type => :OBJECT_FIELD},
        "VALIDITY_TERM" => {:value => "validity_term", :type => :OBJECT_FIELD}
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

    def send_to_ccbs(method, ccbs_json)
        require 'rest-client'

        request_uri = 'http://'+CONN_REST['CCBS']['host']+':'+CONN_REST['CCBS']['port'].to_s+CONN_REST['CCBS']['url_product_tariff']

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

end
