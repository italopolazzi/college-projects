require 'socket'

hostname, port = 'localhost', 2000
socket_connection = TCPSocket.open(hostname, port)

while line = socket_connection.gets
	puts line.chop
end

socket_connection.close