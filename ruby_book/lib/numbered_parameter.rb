# 番号指定パラメーターを使わない場合(ブロックパラメータが1つ)
['1','20','300'].map { |s| s.rjust(3,'0')}

# 番号指定パラメーターを使う場合
['1', '20', '30'].map { _1.rjust(3,'0') }

# 番号指定パラメーターを使わない場合(ブロックパラメータが2つ)
['japan', 'us', 'italy'].map.with_index { |country, n| [n, country]}

# 番号指定パラメーターを使う場合
['japan', 'us', 'italy'].map.with_index { [_2, _1] }

dimenstions = [
  [10, 20],
  [30, 40],
  [50, 60],
]
# dimensions.each do { |dimenstion| p dimensions }と書いたのと同じ
dimenstions.each { p _1 }

# dimensions.each do { |length, width| puts "#{length} / #{width}" }と書いたのと同じ
dimensions.each { puts "#{_1} /#{_2}"}

sum = 0
[[1, 2, 3],[4, 5, 6]].each do
  # 外側のブロックで番号指定パラメーターを使う
  _1.each do
    # 内側のブロックでも番号指定パラメーターを使う
    sum += _1
  end
end

sum = 0
[[1, 2, 3],[4, 5, 6]].each do |values|
  # 外側のブロックで番号指定パラメーターを使う
  values.each do
    # 内側のブロックでも番号指定パラメーターを使う
    sum += _1
  end
end

# 従来のパラメータ |s|と、番号指定パラメータ _1 が混在すると構文エラー
['1', '200', '300'].map { |s| _1.rjust(3, '0')}

numbers = [1, 2, 3, 4]
sum = 0
# ブロックの外にあるsumとは別物の変数sumを用意する
numbers.each do |n; sum|
  # 別物のsumを10で初期化し、ブロックパラメーターの値を加算する
  sum = 10
  sum += n
  # 加算した値をターミナルに表示する
  puts sum
end

# sample.txtを開いて文字列を書き込む(クローズ処理は自動的に行われる)
File.open(./sample.txt, 'w') do |file|
  file.puts('1 行目のテキストです。')
  file.puts('2 行目のテキストです。')
  file.puts('3 行目のテキストです。')
end

a = [1, 2, 3]

# ブロックを渡さないときは指定した値が見つからないとnilが返る
a.delete(100) do
  'Ng'
end

a = [1, 2, 3]

# ブロックを渡さないときは指定した値が見つからないとnilが返る
a.delete 100 do 
  'NG' 
end

a = [1, 2, 3]

# ブロックを渡さないときは指定した値が見つからないとnilが返る
a.delete 100 { 'NG' }

names = ['田中', '鈴木', '佐藤']
san_names = names.map { |name| "#{name}さん" }

names = ['田中', '鈴木', '佐藤']
names.map { |name| "#{name}さん" }.join('と')

names = ['田中', '鈴木', '佐藤']
names.map do |name|
  "#{name}さん"
end.join('と')
