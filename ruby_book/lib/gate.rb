class Gate
  STATIONS = [:umeda, :juso, :mikuni]
  FARES = [160, 190]

  def initialize(name)
    @name = name
  end

  def enter(ticket)
    ticket.stamp(@name)
  end
  
  def exit(ticket)
    fare = calc_fare(ticket)
    fare <= ticket.fare
  end

  def calc_fare(ticket)
    from = STATIONS.index(ticket.stamped_at)
    to = STATIONS.index(@name)
    distance = to - from
    FARES[distance - 1]
  end
end

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