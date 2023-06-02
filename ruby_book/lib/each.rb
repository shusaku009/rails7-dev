numbers = [1, 2, 3, 4, 5]
sum = 0
numbers.each do |n|
  sum += n
end
sum

numbers = [1, 2, 3, 4, 5]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10:n #三項演算子
  sum += sum_value
end
sum

numbers = [1, 2, 3, 4]
sum = 0
numbers.each { |n| sum += n }
sum

numbers = [1, 2, 3, 4]
even_numbers = numbers.select { |n| n.even? }
even_numbers

numbers = [1, 2, 3, 4]
even_numbers = numbers.reject { |n| n.even? }
even_numbers

numbers = [1, 2, 3, 4, 5, 6]
even_numbers = numbers.reject { |n| n % 3 == 0 }
even_numbers

['ruby', 'java', 'python'].map { |s| s.upcase}
['ruby', 'java', 'python'].map(&:upcase)

[1, 2, 3, 4, 5, 6].select { |n| n.odd? }
[1, 2, 3, 4, 5, 6].select(&:odd?)

(1..5).class

a = [1, 2, 3, 4, 5, 6]

def liquid?(temperature)
  (0...100).include?(temperature)
end

def change(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end

(1..5).to_a

[*1..5]

numbers = (1..4).to_a
sum = 0
numbers.each { |n| sum += n}
numbers.each do |n|
  sum += n
end
sum

numbers = []
(1..10).step(2) { |n| numbers << n }
numbers