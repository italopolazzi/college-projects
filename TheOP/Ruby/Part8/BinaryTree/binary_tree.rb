#IMCOMPLETE
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

	def dfs value, mode=:ldr, stack=[], visited=[]
		node = @root
		until node.nil? and stack.empty?
			if mode==:ldr
				unless node.nil? or visited.include? node.left
					stack << node
					node = node.left
				else
					node = stack.pop
					return if node.nil?
					node.value == value ? (return node) : (visited << node)
					node = node.right
				end
			elsif mode==:rld
				if (!node.nil? and !visited.include? node.right and !visited.include? node.left)
					stack << node
					node = node.left
				else
					(node = stack.pop) if node.nil?
					if visited.include? node
						return node if node.value == value
						node = stack.pop
						next
					end
					stack << node
					visited << node
					node = node.right
				end
			elsif mode==:dlr
				unless node.nil? or visited.include? node.left
					node.value == value ? (return node) : (visited << node)
					stack << node
					node = node.left
				else
					node = stack.pop
					node = node.right
				end
			end
		end
	end

	def dfs_rec value, mode=:rld
		# Common lines in dfs recursive functions
		lines = {
			l: Proc.new {|value, node, mode| procsss value, mode, node.left },
			r: Proc.new {|value, node, mode| procsss value, mode, node.right },
			d: Proc.new {|value, node| return node if node.value == value }
		}
		
		# Extracts and mounts an array with the correct sequence of search, based in the chosen mode
		modes = {
			rld: [lines[:l], lines[:r], lines[:d]],
			dlr: [lines[:d], lines[:l], lines[:r]],
			ldr: [lines[:l], lines[:d], lines[:r]]
		}
		
		puts "Mode: #{mode}"
		procsss value, modes[mode]
	end

	private
		def self.tree arr, parent=nil
			return if arr.empty?
			l, r = arr.divide_it
			node = Node.new l.shift, parent
			node.left, node.right = self.tree(l, node), self.tree(r, node)
			node
		end

		def procsss value, mode, node=@root
			return unless node; puts "Passing in: #{node.value}"
			mode.each {|m| m.(value, node, mode)}
		end
end

#######################################################################################################################
	# TESTS
#######################################################################################################################

arr = ["F","B","G","A","D","I","C","E","H"]
tree = arr.build_tree

def tests arr, tree
	puts "Depth: #{tree.depth}"

	puts "Test with:"
	puts "1 - bfs"
	puts "2 - dfs"
	puts "3 - dfs_rec"
	res = gets.chomp.to_i

	# Tests with bfs function
	if res == 1
		no = tree.bfs("A")
		puts no.value if no
	
	# Tests with dfs without recursion
	elsif res == 2
		arr.each do |l| 
			if no = tree.dfs(l, :dlr)
				#puts "Parent: #{no.parent.value}" if no.parent
				puts "No: #{no.value}"
				#puts "Left: #{no.left.value}" if no.left
				#puts "Right: #{no.right.value}" if no.right
				puts
			end	
		end

	# Tests of dfs with recursion (dfs_rec)
	elsif res == 3
		
		[:ldr, :dlr, :rld].each do |mode|
			no = tree.dfs_rec("F", mode)
			puts "No: #{no.value}" if no
			puts
		end
	else
		puts "Invalid option!"
	end
end

tests arr, tree

