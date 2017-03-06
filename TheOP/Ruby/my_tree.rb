class Node
	attr_accessor :value, :l_node, :r_node
	def initialize **vals
		@value 	= vals[:v]
		@r_node = vals[:r]
		@l_node = vals[:l]
	end
end

class Tree
	attr_accessor :root
	def initialize
		@root = nil
	end

	def append value=nil
		temp = Node.new v: value
		if @root.nil?
			@root = temp
		else
			
		end
		true
	end

end

t = Node.new l: "teste"
puts t.inspect