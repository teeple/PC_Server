require 'net/telnet'

server = Net::Telnet::new('Host' => '192.168.1.61', 
									'Port' => 23)
server.login("rater", "rater.123") { |c| print c }
#server.cmd("command") { |c| print c }

#commands = ['cd /data1/rater/HOME/rating', 'tar xvf data.tar'] # And so onb
#commands.each do |command|
#	  server.cmd(command) { |c| print c }
#end

server.close
