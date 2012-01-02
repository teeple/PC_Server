class JsonMappingTable < ActiveRecord::Base

	@@json_mapping_tables = Hash.new
	@@json_mapping_tables["WhatFactor"] = {
	 "view_name" 		=> {:value => "CONDITION_WHAT", :type => :TITLE},  
	 "name" 			=> {:value => "name", :type => :DB_FIELD},
	 "code" 			=> {:value => "code", :type => :DB_FIELD},
	 "description" 		=> {:value => "description", :type => :DB_FIELD},
	 "view_url_groups" 	=> {:value => "URL Groups", :type => :TITLE},
	 "url_groups" 		=> {:value => "what_urlgroup", :type => :HAS_CHILD, :class => "WhatUrlgroup" },
	 "view_qos" 		=> {:value => "Quality of Service", :type => :TITLE},
	 "qos" 				=> {:value => "what_qos", :type => :HAS_CHILD, :class => "WhatQo" },
	 "view_customs"		=> {:value => "CUSTOM", :type => :TITLE},
	 "customs" 			=> {:value => "what_customs", :type => :HAS_CHILD, :class => "WhatCustom" }
	}

	@@json_mapping_tables['WhatUrlgroup'] = [
	 "url" => {:value => "what_urlgroup_factors", :type => :HAS_CHILD_AND_DUMMY, :class => "WhatUrlgroupFactor" }
	]

	@@json_mapping_tables['WhatUrlgroupFactor'] = {
	 "url" => {:value => "url", :type => :DB_FILED}
	}

	def mapping_table
		@@json_mapping_tables
	end 
end

