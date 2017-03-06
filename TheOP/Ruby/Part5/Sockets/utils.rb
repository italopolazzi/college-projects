class String
  def to_title h
    temp = ""; h[:old] ||= " "; h[:new] ||= "-"
    words = self.split(h[:old])
    words.each_with_index do |word, i|
      temp << word.capitalize
      temp << h[:new] if i != words.size-1
    end
    temp
  end
end