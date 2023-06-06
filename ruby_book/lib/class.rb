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

