/(regexp)/ =~ string

puts $1

m = string.match(/(regexp)/)

puts m.values_at(1)
