require 'faker'
require 'awesome_print'

puts Faker::VERSION
puts Faker::Name.name

# apはAwesome Printによって追加される
ap ['Alice', 'Bob', 'Carol']

