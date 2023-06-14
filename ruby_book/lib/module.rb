# helloメソッドを持つGreetableモジュールを定義
module Greetable
  def hello
    'hello'
  end
end

# モジュールのインスタンスは作成できない
greetable = Greetable.new

# 他のモジュールを継承して新しいモジュールを作ることはできない
module AwesomeGreetable < Greetable
end

class Product
  def title
    log 'title is called.'
    'A great movie'
  end

  private

  def log(text)
    # 本来であれば標準ライブラリのLoggerクラスなどを使うべきだが、簡易的にputsで済ませる
    puts "[LOG]#{text}"
  end
end

class User
  def name
    log 'nameis called.'
    'Alice'
  end

  private

  # このメソッドの実装はProductクラスのlogメソッドとまったく同じ
  def log(text)
    puts "[LOG]#{text} "
  end
end

product = Product.new
product.title

user = User.new
user.name

# ログ出力用のメソッドを提供するモジュール
# 「ログ出力できる(log + able)」という意味でLoggableという名前を付けた
module Loggable
  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  # 上で作ったモジュールをincludeする
  include Loggable

  def title
    log 'title is called.'
    'A great movie'
  end
end

class User
  include Loggable

  def name
    log 'nameis called.'
    'Alice'
  end
end

product = Product.new
product.title

user = User.new
user.name

module Loggable
  # logメソッドはprivateメソッドにする
  private

  def log(text)
    puts "[LOG] #{text}"
  end
end

class Product
  include Loggable

  def title
    log 'title is called.'
    'A great movie'
  end
end

product = Product.new
# logメソッドはprivateメソッドなので外部から呼び出せない
product.log 'public?'

module Taggable
  def price_tag
    # priceメソッドはinclude先で定義されているはず、という前提
    "#{price}円"
  end
end

class Product
  include Taggable

  def price
    1000
  end
end

product = Product.new
product.price_tag

class Taggable
  def price_tag
    # あえてselfを付けて呼び出しても良い
    # selfはinclude先のクラス(たとえばProductクラス)のインスタンスになる
    "#{self.price}円"
  end
end

# モジュールの定義はincludeするときと同じ
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end
  
class Product
  # Loggableモジュールのメソッドを特異メソッド(クラスメソッド)として追加する
  extend Loggable
  
  def self.create_products(names)
    # logメソッドをクラスメソッド内で呼び出す
    # (つまりlogメソッド自体もクラスメソッドになっている)
    log 'create_products is called.'
    # 省略
  end
end

# クラスメソッド経由でlogメソッドが呼び出される
Product.create_products([])

# Productクラスのクラスメソッドとして直接呼び出すことも可能
Product.log('Hello')

class Product
  extend Loggable

  # logメソッドをクラス構文の直下で呼び出す
  # (クラスが読み込まれるタイミングで、このlogメソッドも実行される)
  log 'Defined Product class.'
end

# クラス構文の内部でinclude/extendを使う代わりに、クラス名.include.
# またはクラス名.extendの形式でモジュールをinclude/extendする
Product.include Loggable
Product.extend Loggable

module Loggable
  # 省略
end

class Product
  include Loggable
  # 省略
end

Product.include?(Loggable)

Product.included_modules

Product.ancestors

product = Product.new
# product.classはProductクラスを返す
product.class.include?(Loggable)
product.class.included_modules

product = Product.new
# 引数が自クラス、includeしているモジュール、スーパークラスのいずれかに該当すればtrue
product.is_a?(Product)
product.is_a?(Loggable)
product.is_a?(Object)

Array.include?(Enumerable)
Hash.include?(Enumerable)
Range.include?(Enumerable)

# 配列、ハッシュ、範囲でmapメソッドを使う
[1,2,3].map { |n| n * 10 }
{ a: 1, b: 2, c: 3 }.map { |k, v| [k,v * 10 ]}
(1..3).map { |n| n * 10 }

# 配列、ハッシュ、範囲でcountメソッドを使う
[1,2,3].count
{a: 1, b: 2, c: 3}.count
(1..3).count

2 <=> 1
2 <=> 2
1 <=> 2
2 <=> 'abc'

'xyz' <=> 'abc'
'abc' <=> 'abc'
'abc' <=> 'xyz'
'abc' <=> 123

2 > 1
2 <= 1
2 == 1

'abc' > 'xyz'
'abc' <= 'xyz'
'abc' == 'xyz'

class Tempo
  include Comparable

  attr_reader :bpm

  def initialize(bpm)
    @bpm = bpm
  end
  # <=>はComparableモジュールで使われる演算子(メソッド)
  def <=>(other)
    # otherがTempoであればbpm同士を<=>で比較した結果を返す
    # それ以外は比較できないのでnilを返す
    other.is_a?(Tempo)? bpm <=> other.bpm : nil
  end

  # irb上で結果を見やすくするためにinspectメソッドをオーバーライド
  def inspect
    "#{bpm}bpm"
  end
end

t_120 = Tempo.new(120)
t_180 = Tempo.new(180)

t_120 > t_180
t_120 <= t_180
t_120 == t_180

tempos = [Tempo.new(180), Tempo.new(60), Tempo.new(120)]
# sortメソッドの内部では並び替えの際に<=>演算子が使われる
tempos.sort

p self
p self.class

class User
  # ここはクラスの内部
  p self
  p self.class
end

class User
end

# Userクラス自身のクラスはclass
User.class

# ClassクラスのスーパークラスはModuleクラス
Class.superclass

module Loggable
end

# Loggableモジュール自身のクラスはModuleクラス
Loggable.class

# ModuleクラスのスーパークラスはObjectクラス
Module.superclass

class User
  p self
  p self.class
end

module Loggable
  p self
  p self.class
end

module NameChangeable
  def change_name
    # include先のクラスのインスタンス変数を変更する
    @name = 'ありす'
  end
end

class User
  include NameChangeable

  attr_reader :name

  def initialize(name)
    @name = name
  end
end

user = User.new
user.name

# モジュールで定義したメソッドでインスタンス変数を書き換える
user.change_name
user.name

module NameChangeable
  def change_name
    # セッターメソッド経由でデータを変更する
    # (ミックスイン先のクラスでsetterメソッドが未定義であれば、エラーが発生して実装上の問題に気づける)
    self.name = 'ありす'
  end
end

class User
  include NameChangeable

  # ゲッターメソッドとセッターメソッドを用意する
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# Userクラスの使い方は先程と同じ
user = User.new('alice')
user.change_name
user.name

module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

s = 'abc'

# 文字列は通常logメソッドを持たない
s.log('Hello.')

# 文字列sにLoggableモジュールをextendして、特異メソッドを定義する
s.extend Loggable

# Loggableモジュールlogメソッドが呼び出せるようになる
s.log('Hello.')

self.class

# トップレベルにメソッドを定義すると、どのクラスに定義されたことになる？
def greet
  'Hi!'
end
# =>正解は「Objectクラス」

class Object
  private

  def greet
    'Hi!'
  end
end

# private_instance_methodsはそのクラスで定義されているprivateメソッド名の一覧を配列で返す
# また、grepメソッドは引数にマッチした要素を配列で返す
Object.private_instance_methods.grep(:greet)

def greet
  'Hi!'
end

class Foo
  def bar
    # トップレベルで定義したメソッドを呼び出す
    greet
  end
end

Foo.new.bar