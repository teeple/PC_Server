class RatingFactor < ActiveRecord::Base
    establish_connection :dbserv_development

    set_table_name 'rating_factors'
end
