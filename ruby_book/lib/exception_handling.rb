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

# else節を使う場合
begin
  puts 'Hello.'
rescue
  puts '例外が発生しました'
else
  puts '例外は発生しませんでした'
end
# =>Hello.
# 例外が発生しませんでした

# else節を使わない場合
begin
  puts 'Hello.'
  puts '例外は発生しませんでした'
rescue
  puts '例外が発生しました'
end

# 正常に終了した場合
ret =
  begin
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
ret

# 例外が発生した場合
ret =
  begin
    1 / 0
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
ret

def some_methods(n)
  begin
    1 / n
    'OK'
  rescue
    'error'
  ensure
    'ensure'
  end
end

some_methods(1)
some_methods(0)

def some_methods(n)
  begin
    1 / 0
    'OK'
  rescue
    'error'
  ensure
    # ensure節にreturnを書く
    return 'ensure'
  end
end

some_methods(1)
some_methods(0)

def some_methods(n)
  begin
    1 / n
    'OK'
  ensure
    # rescue節なしでensure節にreturnを書く(良くない例)
    return 'ensure'
  end
end

some_methods(1)

# ZeroDivisionErrorが発生して異常終了しそうだが、正常終了してしまう
some_methods(0)

# 例外が発生しない場合
1 / 1 rescue 0

# 例外が発生する場合
1 / 0 rescue 0

require 'date'

def to_date(string)
  begin
    # 文字列のパースを試みる
    Date.parse(string)
  rescue ArgumentError
    # パースできない場合はnilを返す
    nil
  end
end

# パース可能な文字列を渡す
to_date('2021-01-01')

# パース不可能な文字列を渡す
to_date('abcdef')

def to_date(string)
  Date.parse(string) rescue nil
end

to_date('2021-01-01')
to_date('abcdef')

# rescue節で例外処理を変数eに格納する
begin
  1 / 0
rescue => e
  puts "#{e.class}#{e.message}"
  puts e.backtrace
end
# => ZeroDivisionError divided by 0
# (バックトレースは省略)

# 組み込み変数と$!と$@に格納された例外情報を使う
begin
  1 / 0
rescue
  puts "#{$!.class}#{$!.message}"
  puts $@
end
# => ZeroDivisionError divided by 0
# (バックトレースは省略)

def fizz_buzz(n)
  begin
    if n % 15 == 0
      'Fizz Buzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    else
      n.to_s
    end
  rescue => e
    puts "#{e.class}#{e.message}"
  end
end

fizz_buzz(nil)

def fizz_buzz(n)
    if n % 15 == 0
      'Fizz Buzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    else
      n.to_s
    end
  rescue => e
    puts "#{e.class}#{e.message}"
end

fizz_buzz(nil)

# 元のコード(begin/endを省略しない)
users.each do |user|
  begin
    send_mail_to(user)
  rescue => e
    puts e.full_message
  end
end

# begin/endを省略したコード
users.each do |user|
  send_mail_to(user)
rescue => e
  puts e.full_message
end

# ブロックを{}で書いた場合は例外処理のbeginとendを省略できない(構文エラーになる)
users.each { |user|
  send_mail_to(user)
rescue => e
  puts e.full_message
}

# この場合はbeginとendを省略せずに書く必要がある
users.each { |user| 
  begin
    send_mail_to(user)
  rescue => e
    puts e.full_message
  end
}

def fizz_buzz(n)
  if n % 15 == 0
    'FizzBuzz'
  elsif n % 3 == 0
    'Fizz'
  elsif n % 5 == 0
    'Buzz'
  else
    n.to_s
  end
rescue => e
  # 発生した例外をログやメールに残す(ここはputsで代用)
  puts "[LOG]エラーが発生しました: #{e.class}#{e.message}"
  # 捕捉した例外を再度発生させ、プログラム自体は異常終了させる
  raise
end

fizz_buzz(nil)

class NoCountryError < StandardError
  # 独自のクラス名を与えるのが目的なので、実装コードはとくに書かない(継承だけで済ませる)
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # 独自に定義したNoCountryErrorを発生させる
    raise NoCountryError, "無効な国名です。#{country}"
  end
end

currency_of(:italy)

class NoCountryError < StandardError
  # 国名を属性として取得できるようにする
  attr_reader :country

  def initialize(message, country)
    @country = country
    super("#{message}#{country}")
  end
end

def currency_of(country)
  case country
  when :japan
    'yen'
  when :us
    'dollar'
  when :india
    'rupee'
  else
    # NoCountryErrorを発生させる
    raise NoCountryError.new('無効な国名です。', country)
  end
end

begin
  currency_of(:italy)
rescue NoCountryError => e
  # エラーメッセージと国名を出力する
  puts e.message
  puts e.country
end
