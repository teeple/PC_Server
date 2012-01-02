require 'net/telnet'

server = Net::Telnet::new('Host' => '192.168.1.40', 
                                        'Port' => 23)
server.login("app", "app.123") { |c| print c }
server.cmd("command") { |c| print c }

commands = ['cd /home/app/HOME/rating/data',
    'rating_util reload all'] 

commands.each do |command|
    server.cmd(command) { |c| print c }
end
server.close

