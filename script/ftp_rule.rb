require 'net/ftp'

#Dir.chdir('/home/newbiz/product_catalog/')
#tar = IO.popen("tar -cvf data.tar data", "r")
#while line = tar.gets
#	puts line
#end
#tar.close

#Dir.foreach('/home/newbiz/product_catalog/data/rule') do |entry|
#    puts entry
#end

entries = Dir['/home/newbiz/product_catalog/data/rule/*']

ftp = Net::FTP.new('192.168.1.40')
ftp.passive = true
ftp.login('app', 'app.123')
#ftp.list('*') { |file| puts file }
ftp.chdir('/home/app/HOME/rating/data_uocs/from_pc')

#time_now = Time.now
#org_dir = "data" + time_now.strftime("%Y_%m_%d_%H%M%S")
#ftp.rename('data', org_dir)
#ftp.mkdir('data')

entries.each { |entry| 
    ftp.putbinaryfile(entry)
}

ftp.close

