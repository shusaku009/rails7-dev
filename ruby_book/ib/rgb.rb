def to_hex(r, g, b)
  [r, g, b].sum('#') do |n|
    n.to_s(16).rjust(2, '0')
  end
end

def to_ints(hex)
  r = hex[1..2]
  g = hex[3..4]
  b = hex[5..6]
  [r,g,b].map do |s|
    s.hex
  end
end
# ↓
# リファクタリング（上級者向け）
# def to_ints(hex)
#   r, g, b = hex.scan(/\w\w/)
#   [r, g, b].map do |s|
#     s.hex
#   end
# end
# ↓
# 更にリファクタリングP
# def to_ints(hex)
#   hex.scan(/\w\w/).map(&:hex)
# end
# ↓
# ruby 3.0であれば下記のように1行で記述できる
# def to_ints(hex) = hex.scan(/\w\w/).map(&:hex)

