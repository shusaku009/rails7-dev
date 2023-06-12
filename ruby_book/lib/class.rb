# ユーザーのデータを作成する
users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }

# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{user[:first_name]} #{user[:last_name]}, 年齢: #{user[:age]}"
end

# ユーザーのデータを作成する
users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }

# 氏名を作成するメソッド
def full_name(user)
  "氏名: #{user[:first_name]} #{user[:last_name]}" 
end

# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}, 年齢: #{user[:age]}"
end

class User
  attr_reader :first_name, :last_name, :age
  
  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end
end

# 氏名を作成するメソッド
def full_name(user)
  "氏名: #{user[:first_name]} #{user[:last_name]}" 
end

# ユーザーのデータを作成する
users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }


# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{full_name(user)}, 年齢: #{user[:age]}"
end

# Userクラスを定義してfullnameのメソッドを内部で定義
class User
  attr_reader :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}" 
  end

  # 「Alice Rubyさん、20歳」というユーザのオブジェクトを作成する
  alice = User.new('Alice', 'Ruby', 20)
  # 「Bob Pythonさん、30歳」というユーザのオブジェクトを作成する
  bob = User.new('Bob', 'Python', 30)
  
  # どちらもfull_nameメソッドを持つが、保持しているデータが異なるので戻り値は異なる
  alice.full_name

  bob.full_name

end

# ユーザーのデータを作成する
users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }


# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{full_name}, 年齢: #{user[:age]}"
end

class User
  attr_reader :first_name, :last_name, :age
  attr_accessor :first_name

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name = last_name
    @age = age
  end

  # 氏名を作成するメソッド
  def full_name
    "#{first_name} #{last_name}" 
  end

  # 「Alice Rubyさん、20歳」というユーザのオブジェクトを作成する
  user = User.new('Alice', 'Ruby', 20)
  user.first_name
  # first_nameを変更する
  user.first_name = 'ありす'
  user.first_name
end

# initilizeメソッドはデフォルトでprivateメソッドになっているため、外部から呼び出すことはできない
class User
  def initialize
    puts 'initialized.'
  end
end
User.new
user = User.new
user.initialize

# initilizeメソッドに引数をつけると、newメソッドを呼ぶときにも引数が必要になる
class User
  def initialize(name, age)
    puts "name: #{name}, age: #{age}"
  end
end
User.new
User.new('Alice', 20)

class User
  # インスタンスメソッドの定義
  def hello
    "Hello!"
  end
end

user = User.new
# インスタンスメソッドの呼び出し
user.hello

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    @name = name
  end

  def hello
    # インスタンス変数に保存されている名前を表示する
    "Hello, I am #{@name}."
  end
end
user = User.new('Alice')
user.hello

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    @name = name
  end

  def hello
    # shuffled_nameはローカル変数
    shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}"
  end
end
user = User.new('Alice')
user.hello

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    @name = name
  end

  def hello
    # わざとローカル変数への代入をコメントアウトする
    # shuffled_name = @name.chars.shuffle.join
    "Hello, I am #{shuffled_name}"
  end
end
user = User.new('Alice')
user.hello

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    # @name = name
  end

  def hello
    "Hello, I am #{@name}"
  end
end
user = User.new('Alice')
# @nameを参照するとnilになる(つまり名前の部分に何もない)
user.hello

class User
  def initialize(name)
    # インスタンス作成時に渡された名前をインスタンス変数に保存する
    @name = name
  end

  # @nameを外部から参照するためのメソッド
  def name
    @name
  end
end
user = User.new('Alice')
user.name

class User
  def initialize(name)
    @name = name
  end

  # @nameを外部から参照するためのメソッド
  def name
    @name
  end

  # @nameを外部から変更するためのメソッド
  def name=(value)
    @name = value
  end
end
user = User.new('Alice')
# 変数に代入しているように見えるが、実際はname = メソッドを呼び出している
user.name = 'Bob'
user.name

class User
  # @nameを読み書きするメソッドが自動的に定義される
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  # nameメソッドやname=メソッドを明示的に定義する必要はない
end
user = User.new('Alice')
# @nameを変更する
user.name = 'Bob'
# @nameを参照する
user.name

class User
  # 読み取り専用のメソッドだけを定義する
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
user = User.new('Alice')
# @nameの参照はできる
user.name

# @nameを変更しようとするとエラーになる
user.name = 'Bob'

class User
  # 書き込み専用のメソッドだけを定義する
  attr_writer :name

  def initialize(name)
    @name = name
  end
end
user = User.new('Alice')
# @nameは変更できる
user.name = 'Bob'
# @nameの参照はできない
user.name

class User
  # @nameとへのアクセスメソッドを定義する
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end
user = User.new('Alice', 20)
user.name
user.age

class User
  def hello
    'Hello.'
  end
end

# このクラス定義は既存のUserクラスにbyeメソッドを追加することになる
class User
  def bye
    'Bye.'
  end
end

user = User.new
# helloメソッドも呼び出せる
user.hello
user.bye

class User
  def initialize(name)
    @name = name
  end

  # これはインスタンスメソッド
  def hello
    # @nameの値はインスタンスによって異なる
    "Hello, I am #{@name}"
  end
end
alice = User.new('Alice')
# インスタンスメソッドはインスタンス(オブジェクト)に対して呼び出す
alice.hello

bob = User.new('Bob')
# インスタンスによって内部のデータが異なるので、helloメソッドの結果も異なる
bob.hello

class User
  def initialize(name)
    @name = name
  end

  # self.をつけるとクラスメソッドになる
  def self.create_users(names)
    names.map do |name|
      User.new(name)
    end
  end

  # これはインスタンスメソッド
  def hello
    "Hello, I am #{@name}."
  end
end

names = ['Alice', 'Bob', 'Carol']
# クラスメソッドの呼び出し
users = User.create_users(names)
users.each do |user|
  # インスタンスメソッドの呼び出し
  puts user.hello
end

class Product
  # デフォルトの価格を定数として定義する
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  # 第2引数priceのデフォルト値を定数DEFAULT_PRICE(つまり0)とする
  def initialize(name, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end
end

product = Product.new('A free movie')
product.price

# 定数名の例
DEFAULT_PRICE = 0
UNITS = { m: 1.0, ft: 3.28, in: 39.37 }

class Product
  DEFAULT_PRICE = 0

  def self.default_price
    # クラスメソッドから定数を参照する
    DEFAULT_PRICE
  end

  def default_price
    # インスタンスメソッドから定数を参照する
    DEFAULT_PRICE
  end
end
Product.default_price

product = Product.new
product.default_price


class Foo
  # 注:このクラスはクラス定義の読込み時に呼び出される
  puts "クラス構文の直下のself: #{self}"

  def self.bar
    puts "クラスメソッド内のself: #{self}"
  end

  def baz
    puts "インスタンスメソッド内のself: #{self}"
  end
end

Foo.bar

foo = Foo.new
foo.baz

class Foo
  # この時点ではクラスメソッドbarが定義されていないので呼び出せない
  # self.bar => {NoMethodErrorが発生}

  def self.bar
    puts "hello"
  end

  # クラス構文の直下でクラスメソッドを呼び出す
  # (クラスメソッドbarが定義された後なので、呼び出せる)
  self.bar
end

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  # 金額を整形するクラスメソッド
  def self.format_price(price)
    "#{price}円"
  end

  def to_s
    # インスタンスメソッドからクラスメソッドを呼び出す
    formatted_price = Product.format_price(price)
    "name: #{name}, price: #{formatted_price}"
  end
end

product = Product.new('A greet movie', 100)
product.to_s

#クラス名.メソッド名の形式でクラスメソッドを呼び出す
Product.format_price(price)

# self.class.メソッド名の形式でクラスメソッドを呼び出す
self.class.format_price(price)

class User

end

user = User.new
user.to_s
user.nil?

User.superclass

user = User.new
user.methods.sort

user = User.new
user.class

user = User.new

# userはUserクラスのインスタンスか？
user.instance_of?(User)

# userはStringクラスのインスタンスか？
user.instance_of?(String)

user = User.new

# instance_of?は引数で指定したクラスそのもののインスタンスでないとtrueにならない
user.instance_of?(Object)

# is_a?はis-a関係にあればtrueになる
user.is_a?(User)
user.is_a?(Object)
user.is_a?(BasicObject)

# is-a関係にない場合はfalse
user.is_a?(String)

class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
product = Product.new('A great movie', 1000)
product.name
product.price
class DVD < Product
  # nameとpriceはスーパークラスでattr_readerが設定されているので定義不要
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスにも存在している属性
    @name = name
    @price = price
    # DVDクラス独自の属性
    @running_time = running_time
  end
end
dvd = DVD.new('A great movie', 1000, 120)
dvd.name
dvd.price
dvd.running_time

class DVD < Product
  # nameとpriceはスーパークラスでattr_readerが設定されているので定義不要
  attr_reader :running_time

  def initialize(name, price, running_time)
    # スーパークラスのinitilizeメソッドを呼び出す
    super(name,price)
    @running_time = running_time
  end
end
dvd = DVD.new('A great movie', 1000, 120)
dvd.name
dvd.price
dvd.running_time

class DVD < Product
  def initialize(name, price)
    # 引数をすべてスーパークラスのメソッドに渡す、つまりsuper(name, price)と書いたのと同じ
    super

    # サブクラスで必要な処理を書く
  end
end
dvd = DVD.new('A great movie', 1000)
dvd.name
dvd.price

class DVD < Product
  def initialize(name, price)
    # supser()だと引数なしでスーパークラスのメソッドを呼び出す
    # ただし数が合わないのでエラーになる
    super()

    # サブクラスで必要な処理を書く
  end
end
dvd = DVD.new('A great movie', 1000)
dvd.name
dvd.price

class DVD < Product
  # サブクラスで特別な処理をしないなら、同名メソッドを定義する必要はない
  # (スーパークラスに処理を任せる)
  # def initialize(name, price)
  #   super
  # end
end
dvd = DVD.new('A great movie', 1000)
dvd.name
dvd.price

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end
end

product = Product.new('A great movie', 1000)
product.to_s

dvd = DVD.new('An awesome film',3000, 120)
dvd.to_s

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "name: #{name}, price: #{price}, running_time: #{running_time}"
  end
end

product = Product.new('A great movie', 1000)
product.to_s

dvd = DVD.new('An awesome film',3000, 120)
dvd.to_s

class Product
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  def to_s
    "#{super}, running_time: #{running_time}"
  end
end

product = Product.new('A great movie', 1000)
product.to_s

dvd = DVD.new('An awesome film',3000, 120)
dvd.to_s

class Foo
  def self.hello
    'hello'
  end
end

class Bar < Foo
end

Foo.hello
Bar.hello

class Product
  def initialize(name, price)
    puts "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  # initialize(name, price)としてもいいが、このメソッドでは引数を使わないので
  # 可変長引数として一旦任意の引数を受け取り、そのままsuperメソッドに渡す
  def initialize(*)
    super
  end
end

DVD.new('An awesome film', 1000)

class Product
  def initialize(name, price: 0)
    puts "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  # Ruby 2.7までは(*)だけでもキーワード引数をsuperメソッドに渡せたが、
  # Ruby 3.0では*とは別に**でキーワード引数を受け取る必要がある
  def initialize(*, **)
    super
  end
end

DVD.new('An awesome film', price: 1000)

# ...引数を使って通常の引数もキーワード引数もすべて受け取れるようにする
def initialize(...)
  super
end

# 最初の2つの引数のみを使い、他の引数は無視する
def add(a, b, *)
  a + b
end

add(1 ,2 ,3, 4, 5)

# name以外のキーワード引数を無視する
def greet(name:, **)
  "Hello, #{name}"
end

greet(name: 'Alice', friend: 'Bob')

class User
  # デフォルトはpublic
  def hello
    'Hello!'
  end
end

user = User.new
# publicメソッドなのでクラス外から呼び出せる
user.hello

class User
  # ここから下で定義されたメソッドはprivate
  private

  def hello
    'Hello!'
  end
end
user = User.new
# privateメソッドなのでクラスの外部からは呼び出せない
user.hello

class User
  def hello
    # Ruby 2.6以前 = selfをつけるとエラー
    # Ruby 2.7以降 = selfを付けても付けなくてもOK
    "Hello, I am #{self.name}"
  end

  private

  def name
    'Alice'
  end
end
user = User.new

# Ruby 2.6以前 = エラーになる
user.hello

class User
  # ここから下はprivateメソッド
  private

  def foo
  end

  # ここから下はpubulicメソッド
  public

  def bar
  end
end

class Product
  private

  # private
  def name
    'A greate movie'
  end
end

class DVD < Product
  def to_s
    "name: #{name}"
  end
end

dvd = DVD.new
# 内部でスーパークラスのprivateメソッドを呼んでいるがエラーにはならない
dvd.to_s

class Product
  def to_s
    # nameは常に"A greate movie"になるとは限らない
    "name: #{name}"
  end

  private

  def name
    'A greate movie'
  end
end

class DVD < Product
  private

  # スーパークラスのメソッドをオーバーライドする
  def name
    'An awesome film'
  end
end

product = Product.new
# Productクラスのnameメソッドが使われる
product.to_s

dvd = DVD.new
dvd.to_s

# nameをprivateメソッドとして定義する
class Product
  private

  def name
    'A greate movie'
  end
end

# nameをpublicメソッドとしてオーバーライドする
class DVD < Product
  public

  def name
    'An awesome film'
  end
end

# Productクラスのnameメソッドは呼び出せない
product = Product.new
product.name
# DVDクラスのメソッドは呼び出せる
dvd = DVD.new
dvd.name

class User
  private

  # クラスメソッドもprivateメソッドになる？
  def self.hello
    'Hello!'
  end
end
# クラスメソッドはprivateメソッドにはならない！
User.hello

class User
  class << self
    # class << selfの構文であればクラスメソッドでもprivateが機能する
    private

    def hello
      'Hello!'
    end
  end
end
User.hello

class User
  def self.hello
    'Hello!'
  end
  # 後からクラスメソッドをprivateに変更する
  private_class_method :hello
end
User.hello

class User
  # いったんpublicメソッドとして定義する
  def foo
    'foo'
  end

  def bar
    'bar'
  end

  # fooとbarをprivateメソッドに変更する
  private :foo, :bar

  # bazはpublicメソッド
  def baz
    'baz'
  end
end

user = User.new
user.foo
user.bar
user.baz

class User
  # メソッド定義の戻り値:fooをprivateキーワード(実際はメソッド)の引数とする
  # 結果としてfooはprivateメソッドになる
  private def foo
    'foo'
  end
end

user = User.new
user.foo

class User
  attr_accessor :name

  #ゲッターメソッドとセッターメソッドをそれぞれprivateメソッドにする
  private :name, :name=

  def initialize(name)
    @name = name
  end
end

user = User.new('Alice')
user.name
user.name = 'Bob'

class User
  # weightは外部に公開しない
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  # 自分がother_userより重い場合はtrue
  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  # protectedメソッドなので同じクラスかサブクラスであればレシーバ付きで呼び出せる
  def weight
    @weight
  end
end

alice = User.new('Alice', 50)
bob = User.new('Bob', 60)
# Aliceはbobのweightを取得できない
alice.heavier_than?(bob)
bob.heavier_than?(alice)

# クラスの外ではweightを呼び出せない
alice.weight

class User
  attr_reader :name
  # weightメソッドの定義と同時にprotectedメソッドにする(Ruby 3.0以上なら有効)
  protected attr_reader :weight
end

class Product
  DEFAULT_PRICE = 0
end

Product::DEFAULT_PRICE

class Product
  DEFAULT_PRICE = 0
  # 定数をprivateにする
  private_constant :DEFAULT_PRICE
end

# privateなのでクラスの外部からは参照できない
Product::DEFAULT_PRICE

def foo
  # メソッドの内部で定数を定義しようとすると構文エラーになる
  BAR = 123

  BAR * 10
end

# トップレベルで定義する定数
SOME_VALUE = 123

class Product
  # クラス構文の直下で定義する定数
  DEFAULT_PRICE = 0
end

class TrafficLight
  # 配列COLORSを定数として定義し、その各要素も定数として同時に定義する
  COLORS = [
    GREEN = 0,
    YELLOW = 1,
    RED = 2
  ]
end

TrafficLight::GREEN
TrafficLight::YELLOW
TrafficLight::RED
TrafficLight::COLORS

# mapメソッドの戻り値を定数に代入する
NUMBERS = [1, 2, 3].map { |n| n * 10 }
NUMBERS

# 三項演算子を使った条件分岐の結果を定数に代入する
NEW_LINE = windows?  ? "\r\n":"\n"

class Product
  DEFAULT_PRICE = 0
  # 再代入して定数の値を書き換える
  DEFAULT_PRICE = 10000
end

# 再代入後の値が返る
Product::DEFAULT_PRICE

# クラスの外部からでも再代入が可能
Product::DEFAULT_PRICE = 30000

# クラスを凍結する
Product.freeze

# freezeすると変更できなくなる
Product::DEFAULT_PRICE = 5000

class Product
  DEFAULT_PRICE = 0
  # freezeすれば再代入を防止できるが、デメリットのほうが大きので普通はしない
  freeze
  DEFAULT_PRICE = 1000
end

class Product
  NAME = 'A product'
  SOME_NAMES = ['Foo', 'Bar', 'Baz']
  SOME_PRICE = [foo: 1000, bar: 2000, baz: 3000]
end

# 文字列を破壊的に大文字に変更する
Product::NAME.upcase!
Product::NAME

# 配列に新しい要素を追加する
Product::SOME_NAMES << 'Hoge'
Product::SOME_NAMES

# ハッシュに新しいキーと値を追加する
Product::SOME_PRICE[:hoge] = 4000
Product::SOME_PRICE

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz']

  def self.names_without_foo(names = SOME_NAMES)
    # namesがデフォルト値だと、以下のコードは定数のSOME_NAMESを破壊的に変更していることになる
    names.delete('Foo')
    names
  end
end

Product.names_without_foo

# 定数の中身が変わってしまった！
Product::SOME_NAMES

class Product
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze

  def self.names_without_foo(names = SOME_NAMES)
    # freezeしている配列に対しては破壊的な変更はできない
    names.delete('Foo')
    names
  end
end

# エラーが発生するので良きせずに定数の値が変更される事故が防げる
Product.names_without_foo

class Product
  # 配列はfreezeされるが中身の文字列はfreezeされない
  SOME_NAMES = ['Foo', 'Bar', 'Baz'].freeze

  # 1番目の要素を破壊的に大文字に変更する
  Product::SOME_NAMES[0].upcase!
  # 1番目の要素が値が変わってしまった！
end

Product::SOME_NAMES

class Product
  # 中身の文字列もfreezeする
  SOME_NAMES = ['Foo'.freeze, 'Bar'.freeze, 'Baz'.freeze].freeze
end
# 今度は中身もfreezeしているので破壊的な変更はできない
Product::SOME_NAMES[0].upcase!

# mapメソッドで各要素をfreezeし、最後にmapメソッドの戻り値の配列をfreezeする
SOME_NAMES = ['Foo', 'Bar', 'Baz'].map(&:freeze).freeze

class Product
  # 数値やシンボル、ture/falseはfreeze不要(してもかまわないが、意味がない)
  SOME_VALUE = 0
  SOME_TYPE = :foo
  SOME_FLAG = true
end

class Product
  @@name = 'Product'

  def self.name
    @@name
  end

  def initialize(name)
    @@name = name
  end

  def name
    @@name
  end
end

class DVD < Product
  @@name = 'DVD'

  def self.name
    @@name
  end

  def upcase_name
    @@name.upcase
  end
end

# DVDクラスを定義したタイミングで@@nameがDVDに変更される
Product.name
DVD.name

product = Product.new('A greate movie')
product.name

# Product.newのタイミングで@@nameが"A greate movie"に変更される
Product.name
DVD.name

dvd = DVD.new('An awesome film')
dvd.name
dvd.upcase_name

# DVD.newのタイミングで@@nameが"An awesome film"に変更される
product.name
Product.name
DVD.name

class Product
  # クラス変数@@nameの定義を削除する
  # @@name = 'Product'

  def self.name
    @@name
  end
end

# 未定義のクラス変数を参照したのでエラーが発生する
Product.name

# グローバル変数の宣言と値の代入
$program_name = 'Awesome program'

# グローバル変数に依存するクラス
class Program
  def initialize(name)
    $program_name = name
  end

  def self.name
    $program_name
  end

  def name
    $program_name
  end
end

# $program_nameにはすでに名前が代入されている
Program.name

program = Program.new('Super program')
program.name

# Program.newのタイミングで$program_nameが"Super program”に変更される
Program.name
$program_name

class User
  def hello
    'Hello!'
  end

  # helloメソッドのエイリアスメソッドとしてgreetを定義する
  alias greet hello
end

user = User.new
user.hello
user.greet

class User
  class BloodType
    attr_reader :type

    def initialize(type)
      @type = type
    end
  end
end

blood_type = User::BloodType.new('B')
blood_type.type

class User
  # =で終わるメソッドを定義する
  def name=(value)
    @name = value
  end
end

user = User.new
# 変数に代入するような形式でname=メソッドを呼び出せる
user.name = 'Alice'

class Product
  attr_reader :code, :name


  def initialize(code, name)
    @code = code
    @name = name
  end
end

# aとcが同じ商品コード
a = Product.new('A-0001', 'A great movie')
b = Product.new('B-0001', 'An awesome film')
c = Product.new('A-0001', 'A greate movie')

class Product
  attr_reader :code, :name


  def initialize(code, name)
    @code = code
    @name = name
  end

  def ==(other)
    # otherがProductかつ、商品コードが一致していれば同じProductとみなす
    other.is_a?(Product) && code == other.code
  end
end

# aとcが同じ商品コード
a = Product.new('A-0001', 'A great movie')
b = Product.new('B-0001', 'An awesome film')
c = Product.new('A-0001', 'A greate movie')

a = 'abc'
b = 'abc'
a.equal?(b)

c = a
a.equal?(c)

# eql?メソッドで数値を比較すると、1と1.0は異なる値と判定される
1.eql?(1.0)

# eql?メソッドで数値を比較する場合は同じクラス(Integer同士、またはFloat同士)でなければtrueにならない
1.eql?(1)
1.0.eql?(1.0)

# 文字列(Stringオブジェクト)が返すハッシュ値の例
# プログラムを再起動しない限り、同じ文字列からは同じハッシュ値が返る
'JP'.hash #=> -902627378679775197
'US'.hash #=> 4062498145882064624

class CountryCode
  attr_reader :code

  def initialize(code)
    @code = code
  end
end

japan = CountryCode.new('JP')
us = CountryCode.new('US')
india = CountryCode.new('IND')

# CountryCodeクラスのインスタンスをキーにしてハッシュを作成する
currencies = { japan => 'yen', us => 'dollar', india => 'rupee' }

# 同じ国コードなら同じキーとしたいが、そのままでは同一インスタンスだけが同じキーとみなされる
key = CountryCode.new('JP')
currencies[key]
currencies[japan]

class CountryCode
  attr_reader :code

  def initialize(code)
    @code = code
  end

  def eql?(other)
    # otherがCountryCodeかつ、同じ国コードなら同じキーと見なす
    other.instance_of?(CountryCode) && eql?(other.code)
  end

  def hash
    # CountryCodeオブジェクトのハッシュ値として国コードのハッシュ値を返す
    code.hash
  end
end

japan = CountryCode.new('JP')
us = CountryCode.new('US')
india = CountryCode.new('IND')

# ハッシュを作り直す
currencies = { japan => 'yen', us => 'dollar', india => 'rupee' }

# 同じ国コードなら同じキーとしたいが、そのままでは同一インスタンスだけが同じキーとみなされる
key = CountryCode.new('JP')
currencies[key]
currencies[japan]

text = '03-1234-5678'

case text
when /^\d(3)\d(4)$/
  puts '郵便番号です'
when /^\d(4)\d\/d(1,2)\/\d(1,2)$/
  puts '日付です'
when /^\d+-\d+-\d+$/
  puts '電話番号です'
end

value = [1, 2, 3]

# 内部的にはString === value, Array === value, Hash === valueの結果が評価されている
case value
when String
  puts '文字列です'
when Array
  puts '配列です'
when Hash
  puts 'ハッシュです'
end

# Stringクラスを継承した独自クラスを定義する
class Mystring < String
  # stringクラスを拡張するためのコードを書く
end
s = Mystring.new('Hello')
s
s.class

# Arrayクラスを継承した独自クラスを定義する
class MyArray < Array
  # Arrayクラスを拡張するためのコードを書く
end
a = MyArray.new()
a << 1
a << 2
a
a.class

class String
  # 文字列をランダムにシャッフルする
  def shuffle
    chars.shuffle.join
  end
end

s = 'Hello, I am Alice'
s.shuffle
s.shuffle

# 以下のUserクラスは外部ライブラリで定義されている想定
class User
  def initialize(name)
    @name = name
  end

  def hello
    "Hello,#{@name}"
  end
end

# モンキーパッチをあてる前の挙動を確認する
user = User.new('Alice')
user.hello

# helloメソッドにモンキーパッチをあてて独自の挙動をもたせる
class User
  def hello
    "#{@name}さん、こんにちは！"
  end
end

# メソッドの定義を上書きしたのでhelloメソッドの挙動が変わっている
user.hello

alice = 'I am Alice'
bob = 'I am Bob'

# aliceのオブジェクトにだけ、shuffleメソッドを定義する
def alice.shuffle
  chars.shuffle.join
end
# aliceはshuffleメソッドを持つが、bobは持たない
alice.shuffle
bob.shuffle

n = 1
def n.foo
  'foo'
end

sym = :alice
def sym.bar
  'bar'
end

alice = 'I am Alice'
# aliceというオブジェクトに特異メソッドを追加するもうひとつの方法
class << alice
  def shuffle
    chars.shuffle.join
  end
end
alice.shuffle

# クラスメソッドを定義するコード例
class User
  def self.hello
    'Hello.'
  end

  class << self
    def hi
      'Hi.'
    end
  end
end

# 特異メソッドを定義するコード例
alice = 'I am alice'

def alice.hello
  'Hello.'
end

class << alice
  def hi
    'Hi.'
  end
end

class User

end

# クラス構文の外部でクラスメソッドを定義する方法1
def User.hello
  'Hello.'
end

# クラス構文の外部で暮らすメソッドを定義する方法2
class << User
  def hi
    'Hi.'
  end
end

User.hello
User.hi

def display_name(object)
  puts "Name is << #{object.name}"
end

class User
  def name
    'Alice'
  end
end

class Product
  def name
    'A greate movie'
  end
end

# UserクラスとProductクラスはお互いに無関係なクラスだが、display_nameメソッドは何も気にしない
user = User.new
display_name(user)

product = Product.new
display_name(product)

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end
  
  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり' : 'なし'
    "商品名: #{@name} 価格: #{@price}円 在庫: #{stock}"
  end
end

class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    # (本当はデータベースに問い合わせるなどの処理が必要だがここでは省略)
    true
  end
end

product = Product.new('A greate film', 1000)
# スーパークラスはstock?メソッドを持たないのでエラーが起きる
product.display_text

dvd = DVD.new('An awesome film', 3000)
# サブクラスはstock?メソッドを持つのでエラーにならない
dvd.display_text

class Product
  def initialize(name, price)
    @name = name
    @price = price
  end
  
  def display_text
    # stock?メソッドはサブクラスで必ず実装してもらう想定
    stock = stock? ? 'あり' : 'なし'
    "商品名: #{@name} 価格: #{@price}円 在庫: #{stock}"
  end

  def stock?
    # 「サブクラスでstock?メソッドを実装すること」というメッセージとともにエラーを発生させる
    raise 'must implement stock? in subclass.'
  end
end

class DVD < Product
  # 在庫があればtrueを返す
  def stock?
    # (本当はデータベースに問い合わせるなどの処理が必要だがここでは省略)
    true
  end
end

product = Product.new('A greate film', 1000)
# スーパークラスはstock?メソッドを持たないのでエラーが起きる
product.display_text

dvd = DVD.new('An awesome film', 3000)
# サブクラスはstock?メソッドを持つのでエラーにならない
dvd.display_text

def display_name(object)
  if object.respond_to?(:name)
    # nameメソッドで呼び出せる場合
    puts "Name is <<#{object.name}>>"
  else
    # nameメソッドが呼び出せない場合
    puts 'No name.'
  end
end