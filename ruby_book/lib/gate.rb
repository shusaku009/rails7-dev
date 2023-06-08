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