numbers = [1, 2, 3, 4]
sum = 0
for n in numbers
  sum += n
end
sum

sum = 0
for n in numbers do sum += n end
sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end

sum = 0
for n in numbers
  sum_value = n.even? ? n * 10 : n
  sum += sum_value
end

n
sum_value