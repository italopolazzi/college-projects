def caesar_cipher string, adder
	array = Array.new
	string.each_byte { |letter| array.push letter }

	array.each_with_index do |code, index|
		code = limiter 65, 90, code, adder
		code = limiter 97, 122, code, adder
		array[index] = code
	end
	array.each { |num| print num.chr }
end

def limiter min, max, code, adder
	result = code
	if code >= min and code <= max
		result = code + adder
		if result > max
			result = min + (result - max - 1)
		end
	end
	result
end

caesar_cipher "What a string!", 5