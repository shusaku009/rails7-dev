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

retry_count = 0
begin
  puts '処理を開始します。'
  # わざと例外を発生させる
  1 / 0
rescue
  retry_count += 1
  if retry_count <= 3
    puts "retryします。(#{retry_count}回目)"
    retry
  else
    puts 'retryに失敗しました。'
  end
end

def currency_or(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 意図的に例外を発生させる
    raise "無効な国名です。#{country}"
  end
end

currency_or(:japan)
currency_or(:italy)

def currency_or(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # エラーメッセージなしで例外を発生させる(あまり良くない)
    raise
  end
end

currency_or(:italy)

def currency_or(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # RuntimeErrorではなく、ArgumentErrorを発生させる
    raise ArgumentError, "無効な国名です。#{country}"
  end
end

currency_or(:italy)

def currency_or(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # RuntimeErrorではなく、ArgumentErrorを発生させる
    raise ArgumentError.new("無効な国名です。#{country}")
  end
end

currency_or(:italy)

# エラーメッセージを省略して例外を発生させる(あまり良くない)
raise ArgumentError
raise ArgumentError.new

# 大量のユーザにメールを送信する(例外が起きても最後まで続行する)
users.each do |user|
  begin
    # メール送信を実行する
    send_mail_to(user)
  rescue => e
    # full_messageメソッドを使って例外のクラス名、エラーメッセージ、バックトレースをターミナルに出力
    # (ログファイルがあればそこに出力するほうがベター)
    puts e.full_message
  end
end

require 'date'

def convert_reiwa_to_date(reiwa_text)
  m = reiwa_text.match(/令和(?<jp_year>\d+)年(?<month>\d+)月(?<day>\d+)日/)
  year = m[:jp_year].to_i + 2018
  month = m[:month].to_i
  day = m[:day].to_i
  # 正しい日付の場合のみ、Dateオブジェクトを作成する
  if Date.valid_date?(year, month, day)
    Date.new(year, month, day)
  end
end

convert_reiwa_to_date('令和3年12月31日')
convert_reiwa_to_date('令和3年99月99日')

# elseを用意しないパターン(良くない例)
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  end
end
# 想定外の国名を渡すとnilが返る
currency_of(:italy)
currency = currency_of(:italy)
# 戻り値が常にStringオブジェクトだと思いこんでしまい、upcaseメソッドを呼び出してしまった
currency.upcase

# elseを:indiaとして扱うパターン(良くない例)
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  else
    'rupee'
  end
end
# 矛盾した値が返ってきてしまう
currency_of(:italy)

# elseに入ったら例外を発生させるパターン(いい例)
def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    raise ArgumentError, "無効な国名です。#{country}"
  end
end
# 例外が発生する
currency_of(:italy)

# 書き込みモードでファイルを開く
file = File.open('some.txt', 'w')

begin
  # ファイルに文字列を書き込む
  file << 'Hello'
ensure
  # 例外の有無に関わらず必ずファイルをクローズする
  file.close
end

# ブロック付きでオープンすると、メソッドの実行後に自動的にクローズされる
File.open('some.txt', 'w') do |file|
  file << 'Hello'
end

File.open('some.txt', 'w') do |file|
  file << 'Hello'
  # わざと例外を発生させる
  1 / 0
end
# 例外は発生するものの、openメソッドによってクローズ処理自体は必ず行われる
