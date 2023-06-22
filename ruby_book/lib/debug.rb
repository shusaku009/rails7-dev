# def to_hex(r, g, b)
#   [r, g, b].sum('#') do |n|
#     # 変数(ブロックパラメータ)の中身をターミナルに出力する
#     puts n
#     n.to_s(16).rjust(2, '0')
#   end
# end

# def greet(country)
#   # greetメソッドが呼ばれたことを確認
#   puts 'greet start'
#   return 'countryを入力してください' if country.nil?

#   if country == 'japan'
#     # 真の分岐に入ったことを確認
#     puts 'japan'
#     'こんにちは'
#   else
#     # 偽の分岐に入ったことを確認
#     puts 'other'
#     'hello'
#   end
# end

# greet('japan') 

# def calc_fare(ticket)
#   from = STATIONS.index(ticket.stamped_at)
#   to = STATIONS.index(@name)
#   # to - fromの結果をターミナルに出力しつつ、変数distanceに代入する
#   distance = p to - from
#   FARES[distance - 1]
# end

# # ブロックパラメータのｓには、tapメソッドのレシーバ(ここでは文字列の"helo")が入る
# a = 'hello'.tap { |s| puts "<<#{s}>>"}

# # tapメソッドはレシーバをそのまま帰す(つまり a = 'hello'と同じ結果になる)
# a

# # メソッドチェーンを使っているこのコードをデバッグしたい
# '#043c78'.scan(/\w\w/).map(&:hex)

# # tapメソッドを使って、scanメソッドの戻り値をターミナルに表示する
# '#043c78'.scan(/\w\w/).tap { |rgb| p rgb }.map(&:hex)

# class User < ApplicationRecord
#   def facebook_username
#     info = facebook_auth.auth_info.info
#     # ログに変数いnfo.nameの値を出力する
#     logger.debug "[DEBUG] info.name : #{info.name}"
#     info.name
#   end
# end