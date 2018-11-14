require 'net/ssh'
require 'net/ssh/proxy/command'

Net::SSH.start(ENV['HOST'], 'root', remote_user: 'root') do |ssh|
  output = ssh.exec!("hostname")
  puts output
end
