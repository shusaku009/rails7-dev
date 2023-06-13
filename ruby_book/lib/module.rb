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