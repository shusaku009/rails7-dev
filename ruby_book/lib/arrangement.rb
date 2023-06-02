dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
# 面積の計算結果を格納する配列
areas = []
# 配列の要素分だけブロックパラメータを用意すると、各要素の値が別々に格納される
dimensions.each do |length, width|
  areas << length * width
end

# 最初のブロックパラメーターlengthに配列がまるごと渡される
dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
dimensions.each_with_index do |length, width, i|
  puts "length: #{length}, width: #{width}, i:#{i}"
end

# 一度配列で受け取ってから変数に入れ直す
dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
dimensions.each_with_index do |length, width, i|
  length = dimensions[0]
  width = dimensions[1]
  puts "length: #{length}, width: #{width}, i:#{i}"
end

# ブロックパラメーターを()で囲んで、配列の要素を別々のパラメーターとして受け取る
dimensions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
dimensions.each_with_index do |(length, width), i|
  puts "length: #{length}, width: #{width}, i: #{i}"
end

# ()を使わない場合はdimensionに配列[10,20]が代入される
dimension, i = [[10,20],0]
dimension
i

# ()を使うと内側の配列の要素(10,20)を別々の変数(lengthとwidth)に代入できる
(length, width),i = [[10,20], 0]
length
width
i
