# kill -9 $(lsof -i tcp:2000 -t) # Kill 2000 port
require 'socket' #Get sockets from stdlib
require_relative 'config'
require_relative 'utils'
require 'json'
require_relative 'script'

port = 2000 # Sets the port for listen for clients

def set_message_by_code code
	case code
		when 200 then "OK"
		when 301 then "Moved Permanently"
		when 302 then "Moved Temporarily"
		when 303 then "See Other"
		when 404 then "Not Found"
		when 500 then "Server Error"
	end
end

def set_body lines, response
	unless lines.nil?
		lines.each do |line|
			response[:body] << line
		end
	end
end

def request_path request, response
	if request[:method] == "GET"
		
		filename = request[:path]

		if filename =~ /\A(\/){1}(index(.)[a-z]{2,})*\Z/
			lines = File.open(INDEX_FILE).readlines
			response[:code] = 200
			response[:headers][:file_size] = File.size(INDEX_FILE)
		else
			if File.exist? filename
				lines = File.open(filename).readlines
				response[:code] = 200
				response[:headers][:file_size] = File.size(filename)
			else
				response[:code] = 404
				return
			end
		end
		return lines
	end	
end

def mount_response res
	res[:message] = set_message_by_code res[:code]

	final = "#{res[:version]} #{res[:code]} #{res[:message]}\r\n"
	if res[:code] == 200
		res[:headers].each {|header, value|
			final << "#{header.to_s.to_title({old: "_"})}: #{value}\r\n"
		}
		final << "\r\n"
		final << res[:body]
	end
	final
end


def server port
	server = TCPServer.open(port) # Opens the specified port
	loop {
		begin
			client = server.accept # Wait for client to connect

			request = client.gets
			req = Hash.new
			if request =~ /^GET/	
				req[:method], req[:path], req[:version] = request.split
				res = {
					version: req[:version],
					headers: {content_type: "text/html"},
					body: ""
				}

				set_body (request_path(req, res)), res
				client.puts (mount_response res)
			elsif request =~ /^POST/

################ I have to organize the below content	

				headers = {}
				while line = client.gets.split(' ', 2)
					break if line[0] == ""
					headers[line[0].chop] = line[1].strip
				end

				params = client.read(headers["Content-Length"].to_i)
				params = JSON.parse(params)

				temp = ""
				params[:viking.to_s].each do |k, v|
					temp << "<li>#{k.capitalize}</li><li>#{v}</li>"
				end

				template = File.readlines("thanks.html").join("")
				body = template.gsub("<%= yield %>", temp)

				client.puts "HTTP/1.0 200 OK\r\nContent-Length: #{body.size}\r\n\r\n#{body}"

			else
				raise "Invalid request line!"
			end
		rescue => e
			client.puts e.message
		end
		client.close # Close the connection
	}
end

server port