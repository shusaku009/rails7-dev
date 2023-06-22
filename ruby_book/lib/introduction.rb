# Timeクラスで日時を表すオブジェクトを作成する
time = Time.new(2021, 1, 31, 23, 30, 59)

# date ライブラリをrequireするとDateクラスとDateTimeクラスが使えるようになる
require 'date'

#Dateクラスで日付を表すオブジェクトを作成する
date = Date.new(2021, 1, 31)

# DateTimeクラスで日時を表すオブジェクトを作成する(非推奨)
date_time = DateTime.new(2021, 1,  31, 23, 30, 59)

# カレントディレクトリに"secret.txt"が存在するか？
File.exist?('./secret.txt')

# カレントディレクトリに"secret_folder"が存在するか？
Dir.exist?('./secret_folder')

# libディレクトリにあるfizz_buzz.rbの行数をターミナルに表示する
File.open('./lib/fizz_buzz.rb' , 'r') do |f|
  puts f.readlines.count
end

# libディレクトリにhello_world.txtを作成して文字を書き込む
File.open('./lib/hello_world.txt', 'w') do |f|
  f.puts 'Hello World!'
end

require 'fileutils'

# libディレクトリのhello_world.txtをhello_world.rbに移動(リネーム)する
FileUtils.mv('./lib/hello_world.txt', './lib/hello_world.rb')

require 'pathanmae'

# カレントディレクトリ配下にあるlibディレクトリを表すオブジェクトを作る
lib = Pathname.new('./lib')

# ファイルか？
lib.file?

# ディレクトリか？
lib.directory?

# libディレクトリ配下にあるsample.txt へのパス文字列を作る
# (区切り文字のスラッシュは自動的に付与される)
lib.join(''sample.txt).to_s

# URIモジュールのopenメソッドは、もともとprivateメソッドなので呼び出せない
URI.open 'https://example.com'

# ただし、open-uriライブラリをrequireするとopenメソッドが使えるようになる
require 'open-uri'
URI.open 'https://example.com'

require 'csv'

# CSVファイルの出力
CSC.open('./lib/sample.csv', 'w') do |csv|
  # ヘッダ行を出力する
  csv << ['Name', 'Email', 'Age']
  # 明細行を出力する
  csv << ['Aliec', 'alice@example.com', 20]
end

# タブ区切りのCSV(TSV)ファイルを読み込む
CSV.foreach('./lib/sample.tsv', col_sep: "\t") do |row|
  # 各行について、1列目から3列目の値をターミナルに表示する
  puts "1: #{row[0]}, 2: #{row[1]}, 3: #{row[2]}"
end

# jsonライブラリをrequrieすると配列やハッシュでto_jsonメソッドが使えるようになる
require 'json'

user = { name: 'ALice', email: 'alice@example.com', age: 20}

# ハッシュをJSON形式の文字列に変換する(Rubyのハッシュに似ているがこれはJSON形式)
user_json = user.to_json
puts user_json

# JSON文字列をパースしてハッシュに変換する(デフォルトではキーは文字列になる)
JSON.parse(user_json)

JSON.parse(user_json, symbolize_names: true)

