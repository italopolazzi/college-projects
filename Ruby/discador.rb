# Discador
=begin
1    2   3
*    abc def 
4    5   6
ghi  jkl mno
7    8   9
pqrs tuv wxyz
=end

class String
	def each
		raise "No block given!" unless block_given?
		(0...self.size).each {|i|
			yield self[i]
		}
		nil
	end
	def each_with_index
		raise "No block given!" unless block_given?
		(0...self.size).each {|i|
			yield self[i], i
		}
		nil
	end
	def each_with_next
		raise "No block given!" unless block_given?
		(0...self.size).each {|i|
			yield self[i], self[i+1]
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

def discador msg
	digs = 
	{
		d2: ["a","b","c"], 				#2
		d3: ["d","e","f"], 				#3
		d4: ["g", "h", "i"], 			#4
		d5: ["j", "k", "l"],			#5
		d6: ["m", "n", "o"],			#6
		d7: ["p", "q", "r", "s"],		#7
		d8: ["t", "u", "v"],			#8
		d9: ["w", "x", "y", "z"]		#9
	}
	words, result = msg.split(" "), ""
	words.each {|word|
		prev, count = nil, 0
		word.each_with_index {|dig, i|
			unless dig == " " or dig == "/" or dig.to_i.between?(2,9)
				raise (InvalidCaractere.new(dig, i+1, word, "Remove the invalid caractere and then try again!")).message
			end
			prev ||= dig
			if prev != dig
				arr = digs["d#{prev}".to_sym]
				count = count % arr.size if count > arr.size
				result << arr[count-1]
				prev, count = (dig != "/" ? [dig, 1] : [nil, 0])
			else
				count += 1
			end
			result << digs["d#{dig}".to_sym][count-1] if i == word.size-1
		}
		result << " " unless word == words.last
	}
	result
end
=begin
[
	"22/2/22/2/222/2 877766688992 3377772227776668666", 
	"222/266777733444 3/33 826682 43366833 22244282", 
	"7788336 33 27788444 336 727774447777 662666 222666/664433222336/6667777"
]
=end
[
	"22/2/22/2/222/2 877766688992 3377772227776668666",
	"222/266777733444 3/33 826682 43366833 22244282",
	"7788336 33 27788444 336 727774447777 662666 222666/664433222336/6667777",
	""
].each do |code|
	begin
		p discador code
	rescue => e
		puts e
	end
end