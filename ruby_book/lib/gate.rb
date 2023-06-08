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