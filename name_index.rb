module NameIndex
  KATAKANA=['アイウエオ','カキクケコガギグゲゴ','サシスセソザジズゼゾ','タチツテトダヂヅデド','ナニヌネノ','ハヒフヘホバビブベボパピプペポ','マミムメモ','ヤユヨ','ラリルレロ','ワ']

  extend self

  def create_index(names)
    sorted_names = names.sort
    group_index = sorted_names.map do |name|
      KATAKANA.index do |kana|
        kana.include?(name.chr)
      end
    end
    array = Array.new(KATAKANA.size){Array.new()}
    group_index.zip(sorted_names) do |i, name|
      array[i] << name
    end
    array.reject!(&:empty?)
    kanatop = KATAKANA.map(&:chr)
    final = group_index.map do |i|
      kanatop[i]
    end
    final.uniq.zip(array) 
  end
end
