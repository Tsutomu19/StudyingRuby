a = [1,2,3,4,5]
a[1,3]

4,7
配列についてもっと詳しく

配列[位置、所得する長さ]

a = [1,2,3,4,5]
a[1,3]
# => 2,3,4


a = [1,2,3,4,5]
a.values_at(0,2,4)
# 取得したい要素の添字を複数指定できる。



a[a.size -1]
# 最後の要素を取得
a[-1]
a[-2,2]





a = [1,2,3]
a.last
a.last(2)
# 引数に0以上の数値を渡すと、最後のnこの要素を取得できます。

a.first
a.first(2)


a = [1,2,3]
a[-3] = -10
# =>[ -10,2,3]
a[-4] = 10
# エラーが出る。


a = [1,2,3,4,5]
a[1,3] = 100
a
# =>[1,100,5]



a = []
a.push(1)
a.push(2,3)
[1,2,3]


a = [1,2,3,1,2,3]

a.delete(2)
a[1,3,1,3]


a.delete(5)
a


4.7.3

# 配列の連結



a = [1]
b = [2,3]
a.concat(b)
a
# => [1,2,3]
b
=> [2,3]
# aは変更される（破壊的メソッド）
# bは変更されない




a = [1]
b = [2,3]
a + b

a
# =>[1]

b
# =>[2,3]





# 配列の和集合、差集合、積集合
a = [1,2,3]
b = [3,4,5]
a | b
# =>[1,2,3,4,5]


a = [1,2,3]
b = [3,4,5]
a - b
# => 1,2

# 1時間で8ブロック

a = [1,2,3]
b = [3,4,5]
a & b

|,-,&のいずれも元の配列は変更しない


require 'set'


a = Set.new([1,2,3])
b = Set.nes([3,4,5])
a | b
a - b
a & b
# Rubyで集合演算をする場合、配列よりもSetクラスを使う方がいいでしょう。





多重代入　a,b = 1,2など

e.f = 100,200,300
e
f
# 多重代入では左辺の変数より右辺の変数の個数が多い場合は、はみ出した値が切り捨てらレル
e,*f = 100,200,300
e
f
# しかし左辺の変数に*をつけると、残りの全要素を配列として受け取ることができる。





a = []
a.push(1)
a.push(2,3)
# => [1,2,3]






a = []
b = [2,3]""
a.push(1)
a.push(b)
# => [1,[2,3]]

a = []
b = [2,3]
a.push(1)
a.push(*b)
# =>[1,2,3]





def メソッド名（引数1,引数2,※可変長引数）
    # メソッドの処理
end

def greeting(*names)
    "#{names.join('と')},こんにちは！"
end
greeting('田中さん')
greeting('田中さん','鈴木さん')
greeting('田中さん','鈴木さん','佐藤さん')
a = [1,2,3]
[a]
[*a]

a = [1,2,3]
[-1,0,*a,4,5]

a = [1,2,3]
[-1,0] + a + [4,5]




['apple','melon','orange']
# []で文字テルの配列を作成する
%w!apple melon arange!
# ％wで文字列の配列うを作成する
%w(apple melon orange)
# ％wで文字列の配列を作成する（丸いかっっこで囲む）
%w(
    apple
    melon
    orange
)
# 空白文字（スペースや改行を作成）が連続した場合も一つの区切り文字と見なされる



値にスペースを含めたい場合はバックスラッシュでエスケープします
%w(big\apple small\ melon orange)

prefix = 'This is'
%W(#{prifix}\an\apple small\nmelon orange)


'Ruby'.chars
'Ruby,Java,Perl,PHP'.split(',')
splitメソッドは引数で渡した区切り文字で文字列を配列に分割するメソッドです



# 配列に初期値を設定する
a = Array.new


a = Array.new(5)
a => [nil,nil,nil,nil,nil]

a  =  Array.new(5,0)



a = Array.new(5.0)
a
ブロック引数には要素の添字が渡されます。
配列にはブロックの戻り値がそれぞれ初期値として設定されます。




# 2時間で14ブロック


a = Array.new(5,'default')
a


str = a[0]

str


str.upcasel
str

a


str = a[0]
str 
str.upcase!
String







