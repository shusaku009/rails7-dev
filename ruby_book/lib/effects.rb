module Effects
  def self.reverse
    # Procオブジェクト(ラムダ)をメソッドの戻り値にする
    ->(words) do
    # スペースで分解 > 逆順位並び替え > スペースで連結
    words.split(' ').map(&:reverse).join(' ')
    end
  end

  def self.echo(rate)
    ->(words) do
      # スペースならそのまま返す
      # スペース以外ならその文字を指定された回数だけ繰り返す
      words.each_char.map { |c| c == ' ' ? c : c * rate }.join
    end
  end

  def self.loud(level)
    ->(words) do
      # スペースで分割 > 大文字変換と"!"の付与 > スペースで連結
      words.
        split(' ').
        map { |word| word.upcase + '!' * level }.
        join(' ')
    end
  end
end