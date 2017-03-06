=begin

Project 1: Caesar Cipher
Author: Ítalo Polazzi Ferreira (itpzzi@gmail.com)

Your Task
--------------
Implement a caesar cipher that takes in a string and the shift factor and then outputs the modified string:
    > caesar_cipher("What a string!", 5)
    => "Bmfy f xywnsl!"

Quick Tips:
--------------
- You will need to remember how to convert a string into a number.
- Don't forget to wrap from z to a.
- Don't forget to keep the same case.

=end

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

class String
	def each
		self.each_with_index {|x, i| yield x}
	end
	def each_with_index
		raise "No block given!" unless block_given?
		(0...self.size).each {|i|
			yield self[i], i
		}
		nil
	end
end

def cipher str, sum=10
	temp = ""
	sum *= -1 if sum < 0
	str.each {|c|
		cod, max, min = (c.ord + sum), 122, 97
		char = (c.ord.between?(min, max) ? (cod.between?(min,max) ? cod : ((cod % max) + min - 1)) : c)
		temp << char
	}
	temp
end

27.times {|i|
	puts cipher "ba ba ba ca y z j !?????AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", i
}