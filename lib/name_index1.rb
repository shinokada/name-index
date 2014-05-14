input=['キシモト','イトウ','ババ','カネダ','ワダ','ハマダ']
output=[['ア',['イトウ']],['カ',['カネダ','キシモト']],['ハ',['ハマダ','ババ']],['ワ',['ワダ']]]
# KATAKANA={
#   'a'=>'アイウエオ',
#   'ka'=>'カキクケコガギグゲゴ',
#   'sa'=>'サシスセソザジズゼゾ',
#   'ta'=>'タチツテトダヂヅデド',
#   'na'=>'ナニヌネノ',
#   'ha'=>'ハヒフヘホバビブベボパピプペポ',
#   'ma'=>'マミムメモ',
#   'ya'=>'ヤユヨ',
#   'ra'=>'ラリルレロ',
#   'wa'=>'ワ'}

KATAKANA=['アイウエオ','カキクケコガギグゲゴ','サシスセソザジズゼゾ','タチツテトダヂヅデド','ナニヌネノ','ハヒフヘホバビブベボパピプペポ','マミムメモ','ヤユヨ','ラリルレロ','ワ']
array = Array.new(10){Array.new()} 
result = []
counts = Hash.new(0)
input.sort!
input.map do |s|
  KATAKANA.each_with_index do |kana, index|
    result << index if kana.include?(s[0])
  end
end

result.zip(input).each do |val|
  array[val[0]] << val[1]
end
#kanatop =Array.new(10){Array.new()}
kanatop = []
KATAKANA.each do |obj|
  kanatop << obj[0] 
end
p kanatop.zip(array)

# {"ア"=>1, "カ"=>2, "ハ"=>2, "ワ"=>1}
p array
p kanatop
#p result.group_by{|e| e[0]}.flatten(2).uniq  
#result.each do |e|
#  e[0]
#end
