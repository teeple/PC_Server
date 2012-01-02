class TariffFileList < ActiveRecord::Base
    serialize :header
    serialize :body

    belongs_to :action_custom_factor, 
        :class_name => 'ActionCustomFactor', 
        :foreign_key => 'tariff_file_list_id'

    @@json_mapping_table = {
        "tariff_file_list_id"   => {:value => "id", :type => :DB_FIELD},
        "header"                => {:value => "header", :type => :DB_FIELD_ORIG},
        "body"                  => {:value => "body", :type => :DB_FIELD_ORIG}
    }

    def self.json_mapping_table
        return @@json_mapping_table
    end

end
