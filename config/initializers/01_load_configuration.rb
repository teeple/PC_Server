################################################################
## CONTRY CODE
data = File.read("#{RAILS_ROOT}/config/countries.json")
COUNTRY_CODES = JSON.load(data)

################################################################
## Rule Related 
RULE_PATH = "#{RAILS_ROOT}/data/rule/"
DATA_PATH = "#{RAILS_ROOT}/data/"
TARIFF_FILE_PATH = "#{RAILS_ROOT}/data/tariff/"
#RULE_PATH = "/Users/youngmin/Sites/pc/trunk/product_catalog/rule_data/"
RULE = YAML.load_file("#{RAILS_ROOT}/config/template_name.yml")
RATING_FACTOR = YAML.load_file("#{RAILS_ROOT}/config/rating_factor.yml")
CODES = YAML.load_file("#{RAILS_ROOT}/config/code_mapping.yml")

TMPL_PATH = "#{RAILS_ROOT}/app/views/"
#error = File.read("#{RAILS_ROOT}/config/messages.json")
#ERROR_MESSAGES = JSON.load(error)

#TEMPLATE_ROOT = "#{RAILS_ROOT}/app/views"

################################################################
## Connections - Environments ( CCBS, CRM connection Information )
CONN_REST = YAML.load_file("#{RAILS_ROOT}/config/conn_rest.yml")

