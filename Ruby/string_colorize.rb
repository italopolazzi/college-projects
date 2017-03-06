=begin
---- 0 - normal
---- 1 - negrito
---- 3 - itálico
---- 4 - sublinhado
---- 5 - pisca lento
---- 6 - pisca
---- 8 - oculto
---- 9 - sobreposto
30..37 - cores
40..47 - fundos
=end

class String
  # colorization
  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def random
  	colorize rand 30..37
  end

  def random_background
  	colorize rand 40..47
  end
end

#(0..10).each {|i| puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA".colorize(i)}
#(30..47).each {|i| puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA".colorize(i)}
#puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA".random
#puts "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA".random_background
