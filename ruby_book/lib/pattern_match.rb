records = [
  [2021],
  [2019, 5],
  [2017, 11, 25],
]

require 'date'

records.map do |record|
  case record.size
  when 1
    # 年を指定、月と日は1固定
    Date.new(record[0],1, 1)
  when 2
    # 年月を指定
    Date.new(record[0], record[1], 1)
  when 3
    # 年月日を指定
    Date.new(record[0], record[1], record[2])
  end
end

# パターンマッチを使う場合
records.map do |record|
  case record
    in [y]
      Date.new(y, 1, 1)
    in [y, m]
      Date.new(y, m, 1)
    in [y, m, d]
      Date.new(y, m, d)
  end
end

record.map do |record|
  case record.size
  when 1
    y = record[0]
    Date.new(y, 1, 1)
  when 2
    y = record[0]
    m = record[1]
    Date.new(y, m, 1)
  when 3
    y = record[0]
    m = record[1]
    d = record[2]
    Date.new(y, m, d)
  end
end

require 'date'

record = [
  [2021],
  [2019, 5],
  [2017, 11, 25],
]
records.map do |record|
  case record
    in [y]
      Date.new(y, 1, 1)
    in[y, m]
      Date.new(y, m, 1)
    in[y, m, d]
      Date.new(y, m, d)
  end
end

# これはcase文(case/when式)
case array
when [1, 2, 3]
  # 省略
end

# これはパターンマッチ(case/in式)
case[1, 2, 3]
in [a, b, c]
  # 省略
end

cars = [
  {name: 'The Beatle', engine: '105ps'},
  {name: 'Prius', engine: '98ps', motor: '72ps'},
  {name: 'Tesla', motor: '306ps'}
]

cars.each do |car|
  if car.key?(:engine) && car.key?(:motor)
    puts "Hybrid: #{car[:name]} / engine: #{car[:engine]} / motor: #{car[:motor]}"
  elsif car.key?(:engine)
    puts "Gasoline: #{car[:name]} / engine: #{car[:engine]}"
  elsif car.key?(:motor)
    puts "EV: #{car[:name]} / motor: #{car}"
  end
end

cars.each do |car|
  case car
  in {name:, engine:, motor:}
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
  in {name:, engine:}
    puts "Gasoline: #{name} / engine: #{engine}"
  in {name:, motor:}
    puts "EV: #{name} / motor: #{motor}"
  end
end

cars.each do |car|
  case car
    in {name: name, engine: engine, motor: motor}
    # 各キーに対応する値をローカル変数name, engine, motorに代入する
    puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    # 以下略
  end
end

cars.each do |car|
  case car
    in {name:, engine:, motor:}
      # 値を省略してキーのみにすると、対応する値がキーと同じ名前のローカル変数に代入される
      puts "Hybrid: #{name} / engine: #{engine} / motor: #{motor}"
    # 以下略
  end
end

country = 'italy'

case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
end

country = 'italy'

message = 
  case country
  in 'japan'
    'こんにちは'
  in 'us'
    'Hello'
  in 'italy'
    'Ciao'
  end

case country
in 'japan' then 'こんにちは'
in 'us' then 'Hello'
in 'italy' then 'Ciao'
end

country = 'india'

# case文の場合は真になる条件がまったくなくてもエラーにならずnilが返るだけ
case country
when 'japan'
  'こんにちは'
when 'us'
  'Hello'
when 'italy'
  'Ciao'
end

# パターンマッチではいずれの条件にもマッチしない場合は例外が発生する
case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
end

country = 'india'

case country
in 'japan'
  'こんにちは'
in 'us'
  'Hello'
in 'italy'
  'Ciao'
else
  'Unknown'
end

