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

name = 'Alice'
:"#{name.upcase}"

# "文字列リテラル: 値の形式で書くと、キーがシンボルになる"
hash = { 'abc': 123}

# !を区切り文字に使う
%s!ruby is fun!

# ()を区切り文字に使う
%s(ruby is fun)

# シンボルの配列を作成するときには%iを使う
%i(apple orange melon)

name = 'Alice'

# %iでは改行文字や式展開がそのままシンボルになる
%i(hello\ngood-bye #{name.upcase})

# %Iでは改行文字や式展開が有効になった上でシンボルが作られる
%I(hello\ngood-bye #{name.upcase})

string = 'apple'
symbol = :apple
# to_symメソッドを使うと文字列をシンボルに変換することができる
string.to_sym
string.to_sym == symbol

string = 'apple'
symbol - :apple

symbol.to_s
string == symbol.to_s
string + symbol.to_s

# respornd_to?メソッドの引数には文字列とシンボルの両方を渡せる
'apple'.respond_to?('include?')
'apple'.respond_to?(:include?)

# 文字列に'pp'が含まれているか調べる
'apple'.include?('pp')
# シンボルを引数で渡すとエラーになる
'apple'.include?(:pp)

# 国名に応じて通貨を返す(該当する通貨がなければnil)
def find_currency(country)
  curerncies = { japan: 'yen', us: 'dollar', india: 'rupee' }
  curerncies[country]
end

# 指定された国の通貨を大文字にして返す
def show_currency(country)
  currency = find_currency(country)
  # nilではないことをチェック(nilだとupcaseができないため)
  if currency
    currency.upcase
  end
end

def show_currency(country)
  # 条件分岐内で直接変数に代入してしまう(値が取得できれば真、できなければ偽)
  if currency = find_currency(country)
    currency.upcase
  end
end

# nil以外のオブジェクトであれば、a.upcaseと書いた場合と同じ結果になる
a = 'foo'
a&.upcase

def show_currency(country)
  currency = find_currency(country)
  # currencyがnilの場合を考慮して、&.演算子でメソッドを呼び出す
  currency&.upcase
end

# 変数limitがnilであれば10を代入する
limit = nil
limit ||= 10
limit

def user_exists?
  # データベースなどからユーザーを探す
  user = find_user
  if user
    # userが見つかったのでtrue
    true
  else
    # userが見つからなかったのでfalse
    false
  end
end

def user_exists?
  !!find_user
end