puts 'Start.'

# 例外処理を組み込んで例外に対処する
begin
  1 + '10'
rescue
  puts '例外が発生したが、このまま続行する'
end

# 例外処理を組み込んだので、最後まで実行可能
puts 'End.'

# medhod_1にだけ例外処理を記述する
def method_1
  puts 'method_1 start.'
  begin
    method_2
  rescue
    puts '例外が発生しました'
  end
  puts 'method_1 end.'
end

def method_2
  puts 'method_2 start.'
  method_3
  puts 'method_2 end.'
end

def method_2
  puts 'method_3 start.'
  # ZeroDrivisionError(整数を0で除算しようとした場合に発生する例外)を発生させる
  1 / 0
  puts 'method_3 end.'
end

method_1

# medhod_1から例外処理を削除する
def method_1
  puts 'method_1 start.'
  method_2
  puts 'method_1 end.'
end

def method_2
  puts 'method_2 start.'
  method_3
  puts 'method_2 end.'
end

def method_2
  puts 'method_3 start.'
  # ZeroDrivisionError(整数を0で除算しようとした場合に発生する例外)を発生させる
  1 / 0
  puts 'method_3 end.'
end

method_1

begin
  1 / 0
rescue
  puts "エラークラス: #{e.class}"
  puts "エラーメッセージ: #{e.message}"
  puts "バックトレース-----"
  puts e.backtrace
  puts "-----"
end

begin
  1 / 0
rescue ZeroDivisionError
  puts '0で除算しました'
end

begin
  'abc'.foo
rescue ZeroDivisionError
  puts '0で除算しました'
rescue NoMethodError
  puts '存在しないメソッドが呼び出されました'
end

begin
  'abc.'.foo
rescue ZeroDivisionError, NoMethodError
  puts '0で除算したか、存在しないメソッドが呼び出されました'
end

begin
  # NoMethodErrorを発生させる
  'abc'.foo
rescue NameError
  # NoMethodErrorはここで補足される
puts 'NameErrorです'
rescue NoMethodError
  # このrescue節は永遠に実行されない
  puts 'NoMethodErrorです'
end

begin
  'abc'.foo
rescue NoMethodError
  # NoMethodErrorはここで補足される
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

begin
  # NameErrorを発生させる
  Foo.new
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
end

begin
  # ZeroDivisionErrorを発生させる
  1 / 0
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue StandardError
  puts 'その他のエラーです'
end

begin
  # ZeroDivisionErrorを発生させる
  1 / 0
rescue NoMethodError
  puts 'NoMethodErrorです'
rescue NameError
  puts 'NameErrorです'
rescue # 例外クラスをしていしない
  puts 'その他のエラーです'
end