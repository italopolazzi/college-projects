class Array
	def rrand
		n = rand(self.size)-1; self[n]
	end
end

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

class InvalidCaractere < Exception
	attr_reader :position, :caractere, :word, :tip
	def initialize caractere, position, word, tip
		@caractere = caractere
		@position = position
		@word = word
		@tip = tip
	end

	def message
		({
			error: self.class.name,
			caractere: @caractere,
			position: @position,
			word: @word,
			tip: @tip
		}).to_s
	end
end

def converter msg
	digs =
	[	
		["a", "b", "c"], # quando encontrar o a ele está na matrix como [0,0] o número que ele deve representar é o [2, 1]
		["d", "e", "f"], # ou seja, acresce 2 posições "como o botão" e 1 discagem
		["g", "h", "i"], # Com o i [2,2], como discagem ficaria [4, 3]
		["j", "k", "l"],
		["m", "n", "o"],
		["p", "q", "r", "s"],
		["t", "u", "v"],
		["w", "x", "y", "z"]
	]
	words, result = msg.split(" "), ""
	aux, c_c, prev = {col: nil, row: nil}, nil, nil
	words.each {|word|
		word.downcase.each_with_index {|dig, i|
			digs.each_with_index {|row, i|
				row.each_with_index {|col, j| aux = {row: (i + 2), col: (j + 1)} if (dig == col)}
			}
			c_c = aux[:row].to_s
			prev ||= aux[:row].to_s

			result << "/" if c_c == prev and not i == 0
				
			aux[:col].times {|letter|  result << aux[:row].to_s}
			prev, c_c = c_c, nil
		}
		cc = ["]", "|", "~", "´", "[", ";", "!"].rrand
		result << cc unless words.last == word
	}
	result 
end
[
	"babaca trouxa escroto",
	"cansei de tanta gente chata",
	"quem e aqui em paris nao conhecemos",
	"vou te quebrar todinho",
	"biscateira",
	"H linha",
	"Fuck Fake Friends",
	"We dont need then"
].each do |code|
	begin
		p converter code
	rescue => e
		puts e
	end
end




