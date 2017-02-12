=begin

Your Task
--------------
Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.
	> stock_picker([17,3,6,9,15,8,6,1,10])
	=> [1,4]  # for a profit of $15 - $3 == $12

Quick Tips:
--------------
- You need to buy before you can sell
- Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.
___________________________________________________________________________________________________________

- bpd = best_profit_data
- vbp = vbp_best_profit  

=end 

def vbp bpd, vals, val, ind
  profit = vals[:max] - vals[:min]
  
  if bpd[:val].nil? or (profit > bpd[:val] and ind >= vals[:min_p])
    bpd[:val] 		= profit
    bpd[:min_pos] 	= vals[:min_p]
    bpd[:max_pos] 	= ind
  end
end

def stock_picker array
  bpd 	= { min_pos: nil, max_pos: nil, val: nil }
  vals 	= { min: array[0], max: array[0], min_p: 0, max_p: 0 }

  array.each_with_index do |val, ind|
    alt = false

    if val < vals[:min]
      vals[:min]    = val
      vals[:min_p]  = ind
      vals[:max_p] 	= ind
      vals[:max]    = val
      
      alt = true
    end

    if val > vals[:max]
      vals[:max_p]  = ind
      vals[:max]    = val
      
      alt = true
    end
    vbp bpd, vals, val, ind if alt
  end
  [bpd[:min_pos], bpd[:max_pos]]
end

puts (stock_picker Array.new(12) { rand(1...100) }).to_s
puts (stock_picker [17, 3, 1, 9, 20, 8, 6, 1, 10, 20, 2, 4, 17]).to_s
puts (stock_picker [17, 3, 6, 9, 15, 8, 6, 1, 10]).to_s
