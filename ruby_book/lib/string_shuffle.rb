module StringShuffle
  # refinementsが目的なので、refineメソッドを使う
  refine String do
    def shuffle
      chars.shuffle.join
    end
  end
end