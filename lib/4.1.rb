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
end


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
