class DbsRatingFactor < ActiveRecord::Base
    establish_connection :dbserv_development

    set_table_name "rating_factors"
    set_primary_key "id"
end
