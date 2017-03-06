class Person
	attr_reader :name, :num
	def initialize name, num
		@num = num
		@name = name
	end

	def choose
		puts "======================================"
		puts "--------------------------------------"
		puts "Specify the coordinates (just numbers)"
		puts "--------------------------------------"
		hash = {}
		[:row, :column].each {|coor|
			print "#{coor.to_s.capitalize}: "
			hash[coor] = gets.to_i - 1
		}
		puts "======================================"
		hash
	end
end