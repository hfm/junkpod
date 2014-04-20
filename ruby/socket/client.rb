require 'socket'
require 'logger'

log = Logger.new(STDOUT) # 時刻をサクッと知りたかったのでLogger使った

UNIXSocket.open('server.sock') do |sock| # .sockファイルに対してopenする
  while true
    log.info sock.readline.chomp!
  end
end
