require 'socket'

time = 0

count = Thread.new do
  loop do
    time += 1
    Thread.pass
    sleep 1
  end
end

sock = Thread.new do
  Socket.unix_server_loop('server.sock') do |sock, addr|
    p sock
    Thread.new do
      loop do
        begin
          sock.write(time.to_s + "\n")
        rescue Errno::EPIPE => e
          p e
          break
        end
        Thread.pass
        sleep 0.2
      end
    end
  end
end

puts 'server launched!'

count.join
