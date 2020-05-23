14.divmod(4)







numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
    sum += n
end
sum



a = [1,2,3,1,2,3,]
a.delete(2)
a



a = [1,2,3,1,2,3,]
a.delete_if do |n|
    n.odd?
endCD


# eachと異なり、ブロックの戻り値をチェックします。
# ブロックの戻り値はメソッドと同様最後に評価された値

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
    sum_value = n.even?? n*10 : n
    sum += sum_value
end
sum
# nが偶数の時、10倍している。
# 書き方は条件演算子




numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
    sum += n
end
sum

numbers = [1,2,3,4]
sum = 0
numbers.each{|n| sum += n}
sum

# 省略してかく



4.4
# ブロックを使う配列のメソッド

# 以下二つは同じ意味
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each {|n| new_numbers << n*10}
new_numbers

numbers = [1,2,3,4,5]
new_numbers = numbers.map{|n| n}*10}
new_numbers


4.4.2
numbers = [1,2,3,4,5,6]
even_numbers = numbers.select {|n|n.even?}
even_numbers

selectメソッドは各要素に対してブロックを評価し、戻り値が真の要素を集めた配列を返すメソッドです。