def yield_output name, lastname
	yield name if block_given?
	lastname
end

array = Array.new
name = "Italo"
lastname = "Polazzi"

array.push yield_output(name, lastname) #{ |n| puts "My name is: #{n}"}
array << name

puts "Array: " + array.to_s
