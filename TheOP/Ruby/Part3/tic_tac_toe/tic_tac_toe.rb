require 'matrix'
require_relative 'person'
require_relative'validation'

class Matrix
  public :"[]=", :set_element, :set_component, :rows, :column
  def to_r
    self.to_a.map(&:inspect)
  end
end

class TicTacToe
	attr_reader :matrix, :persons
	def initialize(size=3)
		size = 3 if size < 3 or size.nil?
		@matrix = Matrix.zero(size) #Matrix.build(size) {0} #Array.new(size) { Array.new(size, 0) }#[[0,1,0],[0,1,0],[0,1,0]]
		@rounds = 1
		@continue = true
		@result = nil
		@persons = initialize_persons
		playing
		show_result
	end

	private
		def initialize_persons
			temp = {}
			puts "======================================"
			while temp.size < 2 do 
				id = temp.size + 1
				print "Person #{id}, input your name: "
				name = gets.chomp
				puts "--------------------------------------"
				temp["p#{id}"] = Person.new name, id
			end
			puts "======================================"
			temp
		end

		def print_ hash={}
			hash[:num]  ||= 40; hash[:char] ||= "_"
			a = (0..hash[:num]).to_a
			a.each {|i| print hash[:char]; puts "" if i == a.last}
		end

		def playing
			until winner? do
				#a = @persons.values.each(&changing_turn)
				@persons.values.each {|person|
					puts_battle_info
					
					print_ #({char: "#", num: 50})
					puts "Round: #{@rounds} | Turn of #{person.name} (ID: #{person.num})"

					begin
						person_choose person
						if @rounds > 5
							unless continue? @matrix
								@result = {id: 0}
								return
							end
							break if winner?
						end
					rescue => e
						puts e.message; retry
					end

				}
			end
		end
		
		#Current info of the battle
		def puts_battle_info
			#puts self.matrix.to_r
			mtx = @matrix.to_a
			mtx.each_with_index {|x, i|
				if i == 0
					print "   "; mtx.size.times {|i| print "#{i + 1}  "}; puts
				end
				print "#{i + 1} ["
				x.each_with_index {|y, j|
					case y
						when 0 then print "   "
						when 1 then print " X "
						when 2 then print " O "
					end
					print "  " if j < x.size-1
				}; print "]\n"
			}
		end
	
		def person_choose person
			#Leftting the person choose the coordinates
			coordinates = person.choose
			r, c = coordinates[:row], coordinates[:column]
			#Verifing if the chosen coordinate is valid to insert, else re-call the block (giving the second chance to the person)
			if @matrix[r,c] and @matrix[r,c].zero?
				@matrix[r,c] = person.num
				@rounds += 1
			else
				raise "Invalid coordinates! Try again!"
			end
		end

		def reset?
			puts "Reset (y/n)? "
			gets.chomp.downcase == "y" ? initialize : (puts "Bye bye!")
		end

		def show_result
			id = @result[:id]
			if id == 0
				puts "Ended in a tie!"
			else
				name = @persons["p#{id}"].name
				puts "Winner #{id}: Congratulations #{name}!"
			end
			reset?
		end
end