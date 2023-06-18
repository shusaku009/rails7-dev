def greet
  puts 'おはよう'
  # ここでブロックの処理を呼び出す
  yield
  puts 'こんばんは'
end

greet

greet do
  puts 'こんにちは'
end

def greet
  puts 'おはよう'
  # ブロックを2回呼び出す
  yield
  yield
  puts 'こんばんは'
end

greet

greet do
  puts 'こんにちは'
end

def greet
  puts 'おはよう'
  # ブロックの有無を確認してからyieldを呼び出す
  if block_given?
    yield
  end
  puts 'こんばんは'
end

greet

greet do
  puts 'こんにちは'
end

def greet
  puts 'おはよう'
  # ブロックに引数を渡し、戻り値を受け取る
  text = yield 'こんにちは'
  # ブロックの戻り値をターミナルに出力する
  puts text
  puts 'こんばんは'
end

greet do |text|
  # yieldで渡された文字列("こんにちは")を2回繰り返す
  text * 2
end

def greet
  puts 'おはよう'
  # 2個の引数をブロックに渡す
  text = yield 'こんにちは', 12345
  puts text
  puts 'こんばんは'
end

greet do |text|
  # ブロックパラメータが1つであれば、2つめの引数は無視される
  text * 2
end

def greet
  puts 'おはよう'
  # 1個の引数をブロックに渡す
  text = yield 'こんにちは'
  puts text
  puts 'こんばんは'
end

greet do |text, other|
  # ブロックパラメータが2つであれば、2つめの引数はnilになる
  text * 2 + other.inspect
end

# ブロックをメソッドの引数として受け取る
def greet(&block)
  puts 'おはよう'
  # callメソッドを使ってブロックを実行する
  text = block.call('こんにちは')
  puts text
  puts 'こんばんは'
end

greet do |text|
  text * 2
end

def greet(&block)
  puts 'おはよう'
  # ブロックが渡されていなければblockはnil
  unless block.nil?
    text = block.call('こんにちは')
    puts text
  end
  puts 'こんばんは'
end

# ブロックなしで呼び出す
greet

# ブロック付きで呼び出す
greet do |text|
  text * 2
end

def greet(&block)
  puts 'おはよう'
  # 引数のblockを使わずにblock_given?やyieldを使っても良い
  if block_given?
    text = yield 'こんにちは'
    puts text
  end
  puts 'こんばんは'
end

# 日本語版のgreetメソッド
def greet_ja(&block)
  texts = ['おはよう', 'こんにちは', 'こんばんは']
  # ブロックを別のメソッドに引き渡す
  greet_common(texts, &block)
end

# 英語版のgreetメソッド
def greet_en(&block)
  texts = ['good morning', 'hello', 'good evening']
  # ブロックを別のメソッドに引き渡す
  greet_common(texts, &block)
end

# 出力処理用の共通メソッド
def greet_common(texts, &block)
  puts texts[0]
  # ブロックを実行する
  puts block.call(texts[1])
  puts texts[2]
end

# 日本語版のgreetメソッドを呼び出す
greet_ja do |text|
  text * 2
end

# 英語版のgreetメソッドを呼び出す
greet_en do |text|
  text.upcase
end

# 引数の手前に&を付けると、ブロックと見なされる
greet_common(texts, &block)

# &なしで呼び出すと、普通の引数の1つと見なされる
greet_common(texts, block)

def greet(&block)
  puts 'おはよう'
  text =
    if block.arity == 1
      # ブロックパラメータが1個の場合
      yield 'こんにちは'
    elsif block.arity == 2
      # ブロックパラメータが2個の場合
      yield 'こんに', 'ちは'
    end
  puts text
  puts 'こんにちは'
end

# 1個のブロックパラメータでメソッドを呼び出す
greet do |text|
  text * 2
end

# 2個のブロックパラメータでメソッドを呼び出す
greet do |text_1, text_2|
  text_1 * 2 + text_2 * 2
end

# "Hello!"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new do
  'Hello!'
end

# do...endのかわりに{}を使っても良い
hello_proc = Proc.new { 'Hello!' }

# "Hello!"という文字列を返すProcオブジェクトを作成する
hello_proc = Proc.new { 'Hello!' }
# Procオブジェクトを実行する(文字列が返る)
hello_proc.call

add_proc = Proc.new { |a, b| a + b }
add_proc.call(10, 20)

add_proc = Proc.new{ |a = 0, b = 0| a + b }
add_proc.call
add_proc.call(10)
add_proc.call(10, 20)

# Proc.newのかわりにprocメソッドを使う
add_proc = proc { |a, b| a + b }

# RubyでProcオブジェクトを作成し、その処理を呼び出す
add_proc = Proc.new { |a, b| a + b }
add_proc.call(10, 20)
# //javascriptで関数オブジェクトを作成し、その処理を呼び出す
const addProc = (a, b)
addProc(10, 20)

def greet(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんは'
end

def greet(&block)
  # blockのクラス名を表示する
  puts block.class

  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんは'
end

greet do |text|
  text * 2
end

def greet(&block)
  puts 'おはよう'
  text = block.call('こんにちは')
  puts text
  puts 'こんばんは'
end

# Procオブジェクトを作成し、それをブロックの代わりとしてgreetメソッドに渡す
repeat_proc = Proc.new{ |text| text * 2 }
greet(&repeat_proc)

# &なしで呼び出すと普通の引数を1つ渡したことになる
greet(repeat_proc)

