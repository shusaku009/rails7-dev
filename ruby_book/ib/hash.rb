currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# イタリアの通貨を追加する
currencies['italy'] = 'euro'

# 既存の値を上書きする
currencies['japan'] = '円'

# 値を取り出すときはキーを指定する
currencies['japan']

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.each do |key, value|
  puts "#{key} : #{value}"
end

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

currencies.each do |key_value|
  key = key_value[0]
  value = key_value[1]
  puts "#{key} : #{value}"
end

a = {'x' => 1, 'y' => 2, 'z' => 3 }

# すべてのキーと値が同じであればtrue
b = {'x' => 1, 'y' => 2, 'z' => 3}
a == b

# 並び順が異なっていてもキーと値がおなじであればtrue
c = {'z' => 3, 'y'=> 2, 'x' => 1}
a == c

# キー'x'の値が異なるので、false
d = {'x' => 10, 'y'=> 2, 'z' => 3}
a == d

{}.size
{'x' => 1, 'y' => 2, 'z' => 3}.size

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
currencies.delete('japan')
currencies

currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}
# 削除しようとしたキーが見つからないときはnilが返る
currencies.delete('italy')
# ブロックを渡すとキーが見つからないときの戻り値を作成できる
currencies.delete('italy') { |key| "Not found: #{key}" }

currencies = {:japan => 'yen', :us => 'dollar', :india => 'rupee'}
currencies[:japan]

# タスクの状態をシンボルで管理する
status = :done

case status
when :todo
  'これからやります'
when :doing
  '今やってます'
when :done
  'もう終わりました'
end

