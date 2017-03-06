class Array
	def build_tree
		BinaryTree.new(self)
	end
	def divide_it
		return [self, []] if self.size == 1
		return [[],[]] if self.empty?
		half = self.size/2
		[self[0...half], self[half..-1]]
	end
end

class Node
	attr_accessor :left, :right, :value, :parent
	def initialize value=nil, parent=nil
		@value, @parent, @left, @right = value, parent, nil, nil
	end
end

class BinaryTree
	attr_reader :root
	def initialize obj=nil
		if obj.is_a? Node or obj.nil?
			@root = obj
		elsif obj.is_a? Array
			@root = BinaryTree.tree(obj)
		else
			raise "Invalid object."
		end
	end

	def depth root=@root
		return -1 if root.nil?
		hl, hr = depth(root.left), depth(root.right)
		return hl < hr ? hr+1 : hl+1
	end

	def bfs value, queue=[@root]
		until queue.empty?
			node = queue.shift
			return if node.nil?
			return node if node.value == value
			queue << node.left unless node.left.nil?
			queue << node.right unless node.right.nil?
		end
	end

	def dfs value, node=@root, stack=[]
		loop do
			return if node.nil?
			unless node.left.nil?
				stack << node
				node = node.left
			else
				return node if node.value == value
				node = stack.pop
				return if node.nil?
				return node if node.value == value
				node = node.right.nil? ? stack.pop : node.right
			end				
		end
	end

	private
		def self.tree arr, parent=nil
			return if arr.empty?
			l, r = arr.divide_it
			node = Node.new l.shift, parent
			node.left, node.right = self.tree(l, node), self.tree(r, node)
			node
		end
end

tree = ["F","B","G","A","D","I","C","E","H"].build_tree
#puts tree.to_ss
#puts tree.bfs("A").inspect
#puts tree.bfs("J").inspect
puts tree.dfs("Z").inspect
puts "Depth: #{tree.depth}"

#CTRL+D = SELEÇÃO | *2 -> SELEÇÃO geral 
