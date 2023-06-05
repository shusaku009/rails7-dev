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