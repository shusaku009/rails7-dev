a, b = gets.split(' ').map(&:to_i)
if (a * b).odd?
  puts 'Yes'
else
  puts 'No'
end