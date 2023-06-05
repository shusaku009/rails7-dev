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

end

# ユーザーのデータを作成する
users = []
users << { first_name: 'Alice', last_name: 'Ruby', age: 20 }
users << { first_name: 'Bob', last_name: 'Python', age: 30 }


# ユーザーのデータを表示する
users.each do |user|
  puts "氏名: #{full_name}, 年齢: #{user[:age]}"
end
