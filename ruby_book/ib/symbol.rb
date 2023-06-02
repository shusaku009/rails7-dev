# =>ではなく、"シンボル: 値"の記法でハッシュを作成する
currencies = { japan: 'yen', us: 'dollar', india: 'rupee'}
currencies[:japan]

# 値もキーもシンボルの場合
currencies = { japan: :yen, us: :dollar, india: :rupee}

# 文字列のキーとシンボルのキーを混在させる(良いコードではないので注意)
hash = {'abc' => 123, def: 456}

# 値を取得する場合はデータ型を合わせてキーに指定する
hash['abc']
hash[:def]

# データ型が異なると値は取得できない
hash[:abc] # =>nil
hash['def'] # =>nil

person = {
  # 値が文字列
  age: 20,
  # 値が数値
  age: 20,
  # 値が配列
  friends: ['Bob', 'Carol'],
  # 値がハッシュ
  phones: {home: '1234-0000', mobile: '5678-0000'}
}

person[:age]
person[:friends]
person[:phones][:mobile]

def buy_burger(menu, drink, potato)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potato
    # ポテトを購入
  end
end

buy_burger('cheese',true, true)

def buy_burger(menu, drink: true,potato: true)
  # ハンバーガーを購入
  if drink
    # ドリンクを購入
  end
  if potato
    # ポテトを購入
  end
end

# キーワード引数を持つメソッドを呼び出すときは、"引数名: 値"の形式で引数を指定します。
buy_burger('fish',drink: false, potato: false)

# drinkもpotatoもデフォルト値のtrueを使うので指定しない
buy_burger('fish')

# キーワード引数は呼び出し時に自由に順番を入れ替えることができる
buy_burger('fish', potato: false, drink: true)

params = {drink: true, potato: false}
# **をつけてハッシュをキーワード引数として利用する
buy_burger('fish', **params)