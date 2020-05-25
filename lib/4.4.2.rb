# eachメソッドの役割は配列の要素を最初から最後まで順番に取り出すことです。
# その要素をどう扱うかをブロックに記述する。

# ブロックの書き方
numbers = [1,2,3,4]
sum = 0
numbers.each {|n| sum += n}
sum


# mapメソッドの復習
numbers = [1,2,3,4,5]
new_numbers = []
numbers.each {|n| new_numbers << n * 10}
new_numbers


numbers = [1,2,3,4,5]
new_numbers = []
new_numbers  = new_numbers.map{|n| n * 10 }
new_numbers

# セレクトメソッド
numbers = [1,2,3,4,5]
even_numbers = numbers.select {|n| n.even?}
even_numbers




rejectメソッド
numbers = [1,2,3,4,5]
non_multiples_of_three = numbers.reject{|n| n%3 == 0}
non_multiples_of_three

findメソッド
# ブロックの戻り値が真になった最初の要素を返す。
numbers = [1,2,3,4,5]
even_numbers = numbers.find{|n| n.even?}
even_numbers

4.4.4
# injectメソッド
numbers = [1,2,3,4,5]
sum = numbers.inject(0){|result,n|result + n}
ブロックの第一引数は初回のみinjectメソッドの日数が入ります。2回目以降は前回のブロックの戻り値が入ります。
['Mon','Tue','Wed','Thu','Fri','Sat'].inject('Sun'){|result,i| result+i}
# ((((sun + mon)+tue)+wed)+thu)

[1,2,3,4,5,6].select {|n| n.odd?}
# ＆とシンボルを用いた書き換え
[1,2,3,4,5,6].select (&:odd?)

# ブロック引数が一つだけの時
# ブロックの中で呼び出すメソッドには引数がない
# ブロックのなかではブロック引数に対してメソッドを一回呼び出す以外の処理がない。










4.5

(1.5).include?(1)
# true
a = [1,2,3,4,5]
a[1..3]
# 2,3,4
a = 'abcdef'
a[1..3]
# 2番目から4文字目までの要素を取得する








def liquid?(temperature)
    0 <= temperature && temperature < 100
end

liquid?(-1)
liquid?(0)
liquid?(99)
liquid?(100)



def liquid?(temperature)
    (0...100).include?(temperature)
end


lipuid?(-1)
lipuid?(0)
lipuid?(99)
lipuid?(100)



# 範囲オブジェクトとcase分の組み合わせ
def charge(age)
    case age
    when 0..5
        0
    when 6..12
        300
    when 13..18
        600
    else
        1000
    end
end
charge(3)
charge(16)



(1..5).to_a
(1...5).to_a

('a'..'e').to_a
('a'...'e').to_a


[*1..5]
[*1...5]


numbers = (1..4).to_a
sum = 0
numbers.each {|n| sum += n}
sum

sum = 0
(1..4).each {|n|sum += n}
sum


numbers = []
(1..10).step(2){|n| numbers << n}
numbers



to_hex(0,0,0)









