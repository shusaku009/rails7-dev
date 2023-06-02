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

fruits = ['apple', 'melon', 'orange']
numbers = [1, 2, 3]
catch :done do
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        # すべての繰り返し処理を脱出する
        throw :done
      end
    end
  end
end

fruit = ['apple', 'melon', 'orange']
numbers = [1, 2, 3]
catch :done do
  fruits.shuffle.each do |fruit|
    numbers.shuffle.each do |n|
      puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        # catch と一致しないタグをthrowする
        throw :foo
      end
    end
  end
end

ret =
  catch :done do
    throw :done
  end
ret

ret =
  catch :done do
    throw :done, 123
  end
ret

def greet(country)
  # countryがnilならメッセージを返してメソッドを抜ける
  return 'countryを入力してください'if country.nil?

  if country == 'japan'
    'こんにちは'
  else
    'hello'
  end
end

def calc_with_break
  numbers = [1, 2, 3, 4, 5, 6]
  target = nil
  numbers.shuffle.each do |n|
    target = n
    # breakで脱出する
    break if n.even?
  end
  target * 10
end
calc_with_break

def calc_with_return
  numbers = [1, 2, 3, 4, 5, 6]
  targe = nil
  numbers.shuffle.each do |n|
    target = n
    # returnで脱出する？
    return if n.even?
  end
  targe * 10
end
calc_with_return

numbers = [1, 2, 3, 4, 5]
numbers.each do |n|
  # 偶数であれば中断して次の繰り返し処理に進む
  next if n.even?
  puts n
end

numbers = [1, 2, 3, 4, 5]
i = 0
while i < numbers.size
  n = numbers[i]
  i += 1
  # while文でnextを使う
  next if n.even?
  puts n
end

fruits = ['apple', 'orange', 'melon']
numbers = [1, 2, 3, 4, 5]
fruits.each do |fruit|
  numbers.each do |n|
    # 繰り返し処理が入れ子になっている場合は、一番内側のループだけが中断される
    next if n.even?
    puts "#{fruit}, #{n}"
  end
end

foods = ['ピーマン','トマト','セロリ']
foods.each do |food|
  print "#{food}は好きですか？"
  # sampleは配列からランダムに1要素を取得するメソッド
  answer = ['はい', 'いいえ'].sample
  puts answer

  # はいと答えがなければもう一度聞き直す
  redo unless answer == 'はい'
end

foods = ['ピーマン','トマト','セロリ']
count = 0
foods.each do |food|
  print "#{food}は好きですか？"
  # sampleは配列からランダムに1要素を取得するメソッド
  answer = ['はい', 'いいえ'].sample
  puts answer

  count += 1
  # やり直しは2回までにする
  redo if answer != 'はい' && count < 2

  # カウントをリセット
  count = 0
end