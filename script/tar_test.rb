require 'net/ftp'

Dir.chdir('/home/newbiz/product_catalog/data')
tar = IO.popen("tar -cvf rule.tar rule", "r")
while line = tar.gets
	puts line
end
tar.close

