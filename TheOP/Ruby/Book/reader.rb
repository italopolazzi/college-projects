char = "\n"#{}"_"
File.open("file.txt").each(char) {|line| puts line.chomp(char)}
#{}"test".each_byte {|c| puts c.to_s(2)}
