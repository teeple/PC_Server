require 'open-uri'


Dir['/home/newbiz/product_catalog/data/rule/*'].each { |entry|
    File.delete(entry)
}

rule_list = Array.new
rule_list = [ 
            'who_factors.rule',
            'where_factors.rule',
            'when_factors.rule',
            'what_factors.rule',
            'actions.rule',
            'balances.rule',
            'promotions.rule',
            'codes.rule',
            'tariffs.rule',
            'prd_attributes.rule'
          ]

rule_list.each do |rule_file|
  f = open("http://localhost:3000/"+ rule_file)   # Webpage as a file 
  webpage = f.read                                # Read it as one big string 
  f.close
end 

Dir.chdir('/home/newbiz/product_catalog/script')
command = 'ruby ftp_rule.rb'
exec command

#command = ENV['UASYS_HOME'] + "/bin/rating_util reload all " + ENV['SYS_PCHOME'] + "/data" 
#exec command
