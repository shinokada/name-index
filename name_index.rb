class NameIndex
  KATAKANA=['アイウエオ','カキクケコガギグゲゴ','サシスセソザジズゼゾ','タチツテトダヂヅデド','ナニヌネノ','ハヒフヘホバビブベボパピプペポ','マミムメモ','ヤユヨ','ラリルレロ','ワ']

  def self.create_index(names)
    array = Array.new(10){Array.new()}
    result = []
    k =[]
    kanatop = []
    names.sort!
    names.each do |s|
      KATAKANA.each_with_index do |kana, index|
        result << index if kana.include?(s[0])
      end
    end
  
    result.zip(names).each do |val|
      array[val[0]] << val[1]
    end
    array.reject!{ |c| c.empty? }
  
    KATAKANA.each do |obj|
      kanatop << obj[0]
    end

    result.each do |e|
      k << kanatop[e]
    end
    k.uniq.zip(array)
  
  end
end
