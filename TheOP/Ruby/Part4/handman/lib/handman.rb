class Array
	# return self without the object 
	def delete_element obj
		x = self
		x.delete(obj)
		x
	end
	# return the first found element
	def extract_element obj
		self.each_with_index{|x,i|
			(self.delete_at(i); return obj) if obj == x
		} if self.include? obj
	end
	# return a rand element of itself
	def _rand
		self[rand(length)]
	end
end
#puts ('a'..'z').to_a._rand

class String
	def each
		raise "No block given!" unless block_given?
		(0...self.size).each {|i|
			yield self[i]
		}
		nil
	end
end

class Player
	attr_reader :name, :user
	def initialize
		print "\nInput your name: "; @name = gets.chomp
		print "\nInput your user: "; @user = gets.chomp.downcase
	end
end

class Protected
	def self.while limit=100
		if block_given?
			raise "Limit have to be a number!" unless limit.is_a? Integer
			limit *= -1 if limit < 0
			while limit != 0 do
				yield
				limit -= 1
			end
		end
	end
end

require 'yaml'

class Handman
	attr_reader :word
	def initialize
		@player = Player.new if create_player?
		@quit = false
		@misses, @hits = [],[]
		@word = get_a_word
		@chances = get_chances
		@correct_letters = @word.chomp.downcase.split("").uniq
		#puts "Word_size: #{@word.size} | Chances: #{@chances}"
		#p @correct_letters
		playing
	end

	def serialize
		YAML::dump(self)
	end

	def continue
		playing
	end

	private
		def create_player?
			print "\nWants to create a player for the game [y/n]? "
			"y" == gets.chomp.downcase
		end

		def get_a_word
			filename = "../dict"
			raise "File not found!" unless File.exist? filename
			file = File.open(filename)
			lines = file.readlines
			Protected.while do
				temp = lines._rand
				return temp.chomp if temp.length.between?(5,12)
			end
		end

		def get_chances; (@word.size * 1.4).to_i; end

		def has_won?
			#@hits.sort == @correct_letters.sort
			@hits.size == @correct_letters.size
		end

		def end?
			@chances == 0 or has_won?
		end

		def playing
			until end? do
				#puts (@player.nil? ? "Você" : @player.name)
				begin
					puts "Chances: #{@chances}"
					print_
					puts "Misses: #{@misses}\nHits: #{@hits}"
					try_a_letter
				rescue => e
					special_msg e.message
				end
			end
			puts "The word was: #{@word}"
		end

		def print_
			puts;puts
			@word.each {|l| (@hits.include? l) ? (print " #{l} ") : (print " _ ")}
			puts;puts
		end

		def special_msg msg
			puts "***********************************************"
			puts msg
			puts "***********************************************"
		end

		def try_a_letter
			puts; print "Try a letter: " 
			choice = gets.chomp.downcase
			validating_letter choice
		end

		def save! filename
			file = File.open(filename, 'w')
			file.puts YAML::dump(self)
			file.close
		end

		def saving
			saves_folder = "../saves"
			Dir.mkdir("../saves") unless Dir.exist? saves_folder
			filename = "#{@player.user}.save"
			
			if File.exist? filename
				puts "A 'save' for you already exists."
				print "\nWants to replace the saved game [y/n]? "
				answer = gets.chomp.downcase
				return if answer == "n"
			end
			save! filename
		end

		def save
			print "\nWants to save the game [y/n]? "
			answer = gets.chomp.downcase
			saving if answer == "y"
		end

		def quit
			@quit = true
			print "\nWants to quit the game [y/n]? "
			answer = gets.chomp.downcase
			(save; exit) if answer == "y"
		end

		def validating_letter choice		
			if choice == "quit"
				quit
			end
			raise "Invalid character! Try Again!" unless choice.ord.between?(97, 122)
			raise "A letter by turn!" unless choice.size == 1

			if @hits.include? choice or @misses.include? choice
				special_msg "The letter '#{choice}' already has been chosen!"
			elsif @correct_letters.include? choice
				special_msg "Right choice! :)"
				@hits.push choice
			else # fail
				special_msg "Wrong choice! :("
				@chances -= 1
				@misses.push choice
			end
			puts "==============================================="
		end
end
=begin

hits, correct_word = [], "president"

correct_word.each_byte {|character|
	hits.include? character ? print character : print "_"
}
=end

def load_game
	print "\n What's your user: "; user = gets.chomp.downcase
	filename = "#{user}.save"
	if File.exist? filename
		file = File.read filename
		YAML::load(file).continue
		File.delete filename
	else
		raise "File not found!"
	end
end

def start
	puts "1 - New game"
	puts "2 - Load game"
	
	answer = gets.chomp.to_i
	if answer.between?(1,2)
		case answer
			when 1 then Handman.new
			when 2 then load_game
		end
	else
		raise "Invalid option!"
	end
end

begin
	start
rescue => e
	puts e.message
	retry
end