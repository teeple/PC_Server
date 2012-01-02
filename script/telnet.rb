require 'net/telnet'

server = Net::Telnet::new('Host' => '192.168.1.40')
server.login("app", "app.123")  { |str| print str }
server.cmd("date")  { |str| print str }

