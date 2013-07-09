l = lambda { |a, b| a + b }

l = ->(a, b) do
  tmp = a * 7
  tmp * b / 50
end
