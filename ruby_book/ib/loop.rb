numbers = [1, 2, 3, 4, 5]
loop do
  n = numbers.sample
  puts n
  break if n == 5
end

# while文で書いた場合
while true
  n = numbers.sample
  puts n
  break if n == 5
end

def factorial(n)
  # 引数の値を1減らして、factorialメソッド自身をもう一度呼び出す(一種の繰り返し処理)
  # 引数が0になったら1を繰り返して繰り返し処理が終了する
  n > 0 ? n * factorial(n - 1): 1
end

factorial(5)
factorial(0)

def factorial(n)
  ret = 1
  (1..n).each { |n| ret *= n }
  # 1 * 1 * 2 * 3 * 4 * 5
  ret
end
factorial(5)
factorial(0) 

# 範囲オブジェクトに対してmapメソッドを呼び出す
(1..4).map { |n| n * 10 }

# uptoメソッドの戻り値に対してselectメソッドを呼び出す
1.upto(5).select{ |n| n.odd?}

[1,2,3].class
Array.include?(Enumerable)

(1..3).class
Range.include?(Enumerable)

1.upto(3).class
Enumerator.include?(Enumerable)

numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  puts n
  # 5が出たら繰り返しを脱出する
  break if n == 5
end

numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  # 5が出たら繰り返しを脱出する
  break if n == 5
  i += 1
end

numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
  n = numbers[i]
  puts n
  break if n == 5
  i += 1
end

ret = 
  while true
    break
  end

  ret =
  while true
    break 123
  end

  fruits = ['apple', 'orange', 'melon']
  numbers = [1, 2, 3]
  fruits.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      # numbersのループは脱出するが、fruitsのループは継続する
      break if n == 3
    end
  end
