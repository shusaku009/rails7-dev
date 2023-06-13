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

