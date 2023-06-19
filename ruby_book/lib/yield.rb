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

# ブロックではなく、1個のProcオブジェクトを引数として受け取る(&を付けない)
def greet(arrange_proc)
  puts 'おはよう'
  text = arrange_proc.call('こんにちは')
  puts text
  puts 'こんばんは'
end

# Procオブジェクトを普通の引数としてgreetメソッドに渡す(&を付けない)
repeat_proc = Proc.new{ |text| text * 2 }
greet(repeat_proc)

# 3種類のProcオブジェクトを受け取り、それぞれあいさつのじ列に適用するgreetメソッド
def greet(proc_1, proc_2, proc_3)
  puts proc_1.call('おはよう')
  puts proc_2.call('こんにちは')
  puts proc_3.call('こんばんは')
end

# greetメソッドに渡すProcオブジェクトを用意する
shuffle_proc = Proc.new{ |text| text.chars.shuffle.join }
repeat_proc = Proc.new{ |text| text * 2 }
question_proc = Proc.new { |text| "#{text}?" }

# 3種類のPorcオブジェクトをgreetメソッドに渡す
greet(shuffle_proc, repeat_proc, question_proc)

# Proc.newまたはprocメソッドでProcオブジェクトを作成する
Proc.new{ |a, b| a + b }
proc { |a, b| a + b }

# ->構文またはlambdaメソッドでProcオブジェクトを作成する
->(a, b){ a + b }
lambda{ |a, b| a + b }

# Proc.newの作成と実行
add_proc = Proc.new{ |a, b| a + b }
add_proc.call(10, 20)

# ラムダの作成と実行
add_lambda = ->(a, b){ a + b }
add_lambda.call(10, 20)

# Proc.newの場合(引数がnilでもエラーがおきないようにto_iメソッドを使う)
add_proc = Proc.new { |a, b| a.to_i + b.to_i }
# Proc.newは引数が1つまたは3つでも呼び出しが可能
add_proc.call(10)
add_proc.call(10, 20, 100)

# ラムダの場合
add_lambda = ->(a,b){ a.to_i + b.to_i }
# ラムダは個数について厳密なので、引数が2個ちょうどでなければエラーになる
add_lambda.call(10)

add_lambda.call(10, 20, 30)

# Proc.newの場合
add_proc = Proc.new { |a, b| a + b }
add_proc.class
add_proc.lambda?

# ラムダの場合
add_lambda = ->(a,b) { a + b }
add_lambda.class
add_lambda.lambda?

add_proc = Proc.new{ |a,b| a + b }

# callメソッドを使う
add_proc.call(10, 20)
# yieldメソッドを使う
add_proc.yield(10, 20)
# .()を使う
add_proc.(10, 20)
# []を使う
add_proc[10, 20]
# ===を使う
add_proc === [10, 20]

def judge(age)
  # 20より大きければtrueを返すProcオブジェクト
  adult = Proc.new{ |n| n > 20 }
  # 20より小さければtrueを返すProcオブジェクト
  child = Proc.new{ |n| n < 20 }

  case age
  when adult
    '大人です'
  when child
    '子どもです'
  else
    'はたちです'
  end
end

judge(25)

reverse_proc = Proc.new { |s|}

reverse_proc = Proc.new { |s| s.reverse }
# mapメソッドにブロックを渡す代わりに、Procオブジェクトを渡す(ただし&が必要)
['Ruby', 'Java', 'Python'].map(&reverse_proc)

reverse_proc = Proc.new { |s| s.reverse }
other_proc = reverse_proc.to_proc
# Procオブジェクトに対してto_procメソッドを呼んでも自分自身が返るだけ
reverse_proc.equal?(other_proc)

spilit_proc = :split.to_proc
split_proc

# 引数が一つの場合は、'a-b-c-d e'.splitと同じ(ホワイトスペースで分割する)
split_proc.call('a-b-c-d e')

# 引数が2つの場合は'a-b-c-d e'.splitと同じ(指定された文字で分割する)
split_proc.call('a-b-c-d e', '-')

# 引数が3つの場合は'a-b-c-d e'.aplit('-', 3)と同じ(分割する個数を制限する)
split_proc.call('a-b-c-d e', '-',3)

['ruby', 'java', 'python'].map { |s| s.upcase }
['ruby', 'java', 'python'].map(&:upcase)

def generate_proc(array)
  counter = 0
  # Procオブジェクトをメソッドの戻り値とする
  Proc.new do
    # ローカル変数のcounterを加算する
    counter += 10
    # メソッド引数のarrayにcounterの値を追加する
    array << counter
  end
end

values = []
sample_proc = generate_proc(values)
values

# Procオブジェクトを実行するとgenerate_procメソッドの引数だったvaluesの中身が書き換えられる
sample_proc.call
values

# generate_procメソッド内のローカル変数counterも加算され続ける
sample_proc.call
values

# 処理の開始時と終了時にログを記録する共通メソッド
# (ここでは実際にログに記録する代わりにputsで代用)
def with_logging(name)
  puts "[LOG] START: #{name}"
  ret = yield
  puts "[LOG] END: #{name}"
  ret
end

# ログ付きで数字の加算を実行する
answer = with_logging('add numbers') do
  1 + 2
end
answer

# ログ付きでmapメソッドを実行する
numbers = with_logging('Array#map')do
  [1, 2, 3].map { |n| n * 10 }
end
numbers

