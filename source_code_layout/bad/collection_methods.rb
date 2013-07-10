a = [1, 2, 3, 4, 5]
a.collect { |x| x * 10 }

a.inject{ |sum, n| sum + n }

a.detect { |item| item > 3 }

a.find_all { |item| item > 3 }
