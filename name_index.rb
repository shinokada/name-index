class NameIndex
  KATAKANA=['アイウエオ','カキクケコガギグゲゴ','サシスセソザジズゼゾ','タチツテトダヂヅデド','ナニヌネノ','ハヒフヘホバビブベボパピプペポ','マミムメモ','ヤユヨ','ラリルレロ','ワ']

  def self.create_index(names)
    array = Array.new(10){Array.new()}
    result = []
    k =[]
    kanatop = []
    names.sort!
    # find where name belong to in KATAKANA [0, 1, 1, 5, 5, 9]
    names.each do |s|
      KATAKANA.each_with_index do |kana, index|
        result << index if kana.include?(s[0])
      end
    end
 
    # zip result and name and for each array insert to array  [["イトウ"], ["カネダ", "キシモト"], [], [], [], ["ハマダ", "ババ"], [], [], [], ["ワダ"]]
    result.zip(names).each do |val|
      array[val[0]] << val[1]
    end

    # reject empty array
    array.reject!{ |c| c.empty? }
  
    # find KATAKANA top letters
    KATAKANA.each do |obj|
      kanatop << obj[0]
    end

    # for each result [0,1,1,5,5,9], insert kanatop to k array
    result.each do |e|
      k << kanatop[e]
    end
    # create k unique and zip with array
    k.uniq.zip(array) 
  end
end
