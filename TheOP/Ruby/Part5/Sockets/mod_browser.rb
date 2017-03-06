require 'socket'
require 'json'
require_relative 'utils'

host, port, request = "localhost", 2000, nil

print "Choose the request method (GET/POST): "
request_method = gets.chomp.upcase

base = {
	method: request_method,
	version: "HTTP/1.0"
}

def mount_params params
	print "\nInput your name: "
	params[:viking][:name] = gets.chomp
	print "\nInput your email: "
	params[:viking][:email] = gets.chomp
	params.to_json
end

def mount_headers params_size
	{
		content_type: "application/x-www-form-urlencoded",
		content_length: params_size
	}
end

def post_request h
	final = basic_request h
	h[:headers].each do |header, value| 
		final << "#{header.to_s.to_title({old: "_"})}: #{value}\r\n"
	end
	final << "\r\n"
	final << h[:params]
	final
end

def basic_request h
	"#{h[:method]} #{h[:path]} #{h[:version]}\r\n"
end

if request_method == "GET"
	print "Choose the file to request: "
	base[:path] = gets.chomp
	request = basic_request base
elsif request_method == "POST"
	params = mount_params({viking: Hash.new})
	headers = mount_headers params.size
	base[:path], base[:headers], base[:params] = "/script.rb", headers, params
	request = post_request base
end
# Opens a connection with the host specified in the default port (80)
socket = TCPSocket.open(host, port)
# Sends the request
socket.print(request)

# Reads the entire response
response = socket.read

# Will split the response in header and body, limiting by "\r\n\r\n"
#headers, body = response.split("\r\n\r\n", 2)
# Prints the response body
print response
#print body
