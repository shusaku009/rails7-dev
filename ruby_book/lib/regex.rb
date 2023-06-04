old_syntax = <<TEXT
{
  :name => 'Alice',
  :age => 20,
  :gender =>'female'
}
TEXT

convert_hash_syntax(old_syntax)

text = <<TEXT
I love ruby.
Python is a greate language.
Java and JavaScript are different.
TEXT

text.scan(/[A-Z][A-Za-z]+/)

text = <<TEXT
私の郵便番号は123-4567です。
僕の住所は677-0056兵庫県西脇市板波町1234だよ。
TEXT

puts text.gsub(/(\d{3})(\d{4)/){ "#{$1}-#{$2}" }

def hello(name)
  puts "Hello, #{name}!"
end

hello('Alice')

hello('Bob')

hello('Carol')

r = /\d{3}-\d{4}/
r.class

# マッチした場合は最初にマッチした文字列の開始位置が返る(つまり真)
'123-4567' =~ /\d{3}-\d{4}/

# マッチしない場合はnilが返る
'hello' =~ /\d{3}-\d{4}/

# if文で=~を使うとマッチしたかどうかを判別できる
if '123-4567' =~ /\d{3}-\d{4}/
  puts 'マッチしました'
else
  puts 'マッチしませんでした'
end

# 左辺に正規表現を置いても結果は同じ
/\d{3}-\d{4}/ =~ '123-4567'
/\d{3}-\d{4}/ =~ 'hello'

# マッチしなければtrue
'hello' !~ /\d{3}-\d{4}/

# マッチすればfalse
'123-4567' !~ /\d{3}-\d{4}/

text = '私の誕生日は1999年1月1日です。'
m = /(\d+)年(\d+)月(\d+)/.match(text)
m[1]
m[2]
m[3]

text = '私の誕生日は1999年1月1日です。'
/(\d+)年(\d+)月(\d+)/.match(text)
/(\d+)年(\d+)月(\d+)/.match(foo)

text = '私の誕生日は1999年1月1日です。'
# 真偽値の判定とローカル変数への代入を同時にやってしまう
if m = /(\d+)年(\d+)月(\d)日/.match(text)
  # マッチした場合の処理(ローカル変数のmを使う)
  puts m
else
  # マッチしなかった場合の処理
end

text = '私の誕生日は1999年1月1日です。'
m = /(\d+)年(\d+)月(\d)日/.match(text) 
# マッチした部分全体を取得する
m[0]
# キャプチャの1番目を取得する
m[1]
# キャプチャの2番目から2個取得する
m[2, 2]
# 最後キャプチャを取得する
m[-1]
# Rangeを使って取得する
m[1..3]

text = '私の誕生日は1999年1月1日です。'
m = text.match(/(\d+)年(\d+)月(\d)日/)

# キャプチャに(?<name>)というメタ文字で名前をつけることができる
(?<year>\d+)年(?< month > \d+)月(?< day > \d+)日

text = '私の誕生日は1999年1月1日です。'
m = /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/.match(text)
# シンボルで名前を指定してキャプチャの結果を取得する
m[:year]
m[:month]
m[:day]

# 文字列で指定することもできる
m['year']
# 連番で指定することもできる
m[2]

text = '私の誕生日は1999年1月1日です。'
# キャプチャした名前がそのままローカル変数に割り当てられる
if /(?<year>\d+)年(?<month>\d+)月(?<day>\d+)日/ =~ text
  puts "#{year}/#{month}/#{day}"
end

