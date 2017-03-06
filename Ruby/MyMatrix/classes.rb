require 'matrix'
=begin
class MyMatrix
	attr_accessor :matrix
	def initialize h
		@dft = h[:dft] || 0
		@row = h[:row] || 2
		@col = h[:col] || @row
		@matrix = Array.new(@row) do
			block_given? ? Array.new(@col) {yield} : Array.new(@col, @dft)
		end
	end
	def to_readable
		@matrix.to_a.map(&:inspect)
	end
	def [](i)
		c = 0
		@matrix.each {|x| c == i ? (return x) : (c += 1)}
	end
	def get r, c
		i = 0
		self[r].each {|x| i == c ? (return x) : (i += 1)}
	end
	def set r, c, v
		i = 0
		self[r].each {|x| i == c ? (@matrix.send x) : (i += 1)}
	end
end

class MyMatrix < Matrix
	def initialize size=3
		self.build(size)
	end
	def to_readable
		self.to_a.map(&:inspect)
	end
end

class Matrix
	public :"[]=", :set_element, :set_component
	def to_readable
		self.to_a.map(&:inspect)
	end
end
=end

class Array
	def to_readable
		self.map(&:inspect)
	end
end
