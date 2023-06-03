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

currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
currencies.keys

currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
currencies.values

currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
currencies.has_key?(:japan)

h = { us: 'dollar', india: 'rupee'}
# 変数hの要素を**で展開させる
{ japan: 'yen', **h}

h = { us: 'dollar', india: 'rupee'}
# **をつけない場合はエラーになる
{ japan: 'yen', h}

# 上記のコードと同じ結果
h = { us: 'dollar', india: 'rupee'}
{ japan: 'yen' }.merge(h)

# ハッシュを引数として受け取り、疑似キーワード引数を実現する
def buy_burger(menu, options = {})
  drink = options[:drink]
  potato = options[:potato]
end

buy_burger('cheese', drink: true, potato: true)

# 想定外のキーワードはothers引数で受け取る
def buy_burger(menu, drink: true, potato: true, **others)
  puts others

  others.each do |other|
    "#{other}"
  end
end

buy_burger('cheese', drink: true, potato: true, salada: true, chicken: false)

# 想定外のキーワードはothers引数で受け取る
def buy_burger(menu, drink: true, potato: true)
  puts "#{menu}  #{drink}: #{potato}"
end

# キーワード引数として渡したいハッシュを定義する
params = {drink: true, potato: false}
# キーワードを引数として渡すと自動的にキーワード引数に変換される
buy_burger('fish', **params)

# optionsは任意のハッシュを受け付ける
def buy_burger(menu, options = {})
  puts options
end

# ハッシュを第2引数として渡す
buy_burger('fish', {'drink' => true, 'potato' => false})

# ハッシュを省略してメソッドを呼び出す
buy_burger('fish', 'drink' => true, 'potato' => false)

# menuとoptionsの順番を入れ替える
def buy_burger(options = {}, menu)
  puts options
end

# optionsは最後の引数ではないので、ハッシュリテラルの{}は省略できない
buy_burger('fish', 'drink' => true, 'potato' => false)#=>エラー(SyntaxError)
# 最後の引数でなければ{}をつけてハッシュを作成する
buy_burger('fish', {'drink' => true, 'potato' => false})

a = ['fish', { drink: true, potato: false}]
a[0]
a[1]

# 配列でも同様に{}を省略することができる
b = ['fish', drink: true, potato: false]
b[0]
b[1]

def buy_burger(options = {}, menu)
  puts options
end
# このコードはエラーになる、Rubyはブロックの{}だと解釈されるため
buy_burger{'drink' => true, 'potato' => false}, fish

# 第1引数にハッシュの{}がつく場合は()を省略できない
buy_burger({'drink' => true, 'potato' => false}, 'fish')

def buy_burger(menu,options = {})
puts options
end
# 第2引数以降にハッシュの{}が付く場合は()を省略することができる
buy_burger 'fish', {'drink' => true, 'potato' =>false}

# ついうっかり「ハッシュの内容をターミナルに出力したい→エラー」
puts { foo: 1, bar: 2}
# ()で囲む必要がある
puts ({ foo: 1, bar: 2 })

# ついうっかり2 「resalutの内容が指定したハッシュの内容に一致するか検証したい→エラー」
assert_equal { foo: 1, bar: 2},resault
# ()で囲む必要がある
assert_equal({ foo: 1, bar: 2},resault)

# to_aメソッドでハッシュから配列へ
currencies = { japan: 'yen', us: 'dollar', india: 'rupee' }
currencies.to_a

array = [[:japan, "yen"], [:us, "dollar"], [:india, "rupee"]]
array.to_h

array = [:japan, "yen", :us, "dollar", :india, "rupee"]
Hash[*array]

h = {}
h[:foo]

h = Hash.new('hello')
h[:foo]

h = Hash.new('hello')
a = h[:foo]
b = h[:bar]
# aとbは同一オブジェクト
a.equal?(b) 

# 変数aに破壊的な変更を適用すると、変数bの値も一緒に変わってしまう
a.upcase!

# キーが見つからないとブロックがその都度実行され、ブロックの戻り値がデフォルトになる
h = Hash.new { 'hello' }
a = h[:foo]
b = h[:bar]

h = Hash.new { |hash, key| hash[key] = 'hello' }
h[:foo]
h[:bar]