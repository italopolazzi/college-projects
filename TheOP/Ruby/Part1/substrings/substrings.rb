=begin

Project 3: Substrings
Author: Ítalo Polazzi Ferreira (itpzzi@gmail.com)

Your Task
--------------
Implement a method #substrings that takes a word as the first argument and then an array of valid substrings (your dictionary) as the second argument. It should return a hash listing each substring (case insensitive) that was found in the original string and how many times it was found.
	> dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
	=> ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

	> substrings("below", dictionary)
	=> {"below"=>1, "low"=>1}
Next, make sure your method can handle multiple words:
    > substrings("Howdy partner, sit down! How's it going?", dictionary)
    => {"down"=>1, "how"=>2, "howdy"=>1,"go"=>1, "going"=>1, "it"=>2, "i"=> 3, "own"=>1,"part"=>1,"partner"=>1,"sit"=>1}

Quick Tips:
--------------
- Recall how to turn strings into arrays and arrays into strings.

=end

dict = ["boy","girl","family","dog","world","better","butter","home","school","sweet","dad","mom","juice","below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings phrase, dict
	result = Hash.new(0)
	dict.each { |w| result[w.to_sym] = phrase.scan(Regexp.new w).length if phrase.include? w }
	result
end

puts substrings "Howdy partner, sit down! How's it going?", dict
