# eachメソッドでは何番目の要素を処理しているのか、ブロック内で判別できません。繰り返し処理をしている要素の添字も取得したい。
# そんなときに使うのがこのメソッド。


fruits = ['apple', 'orange','melon']

fruits.each_with_index {|fruit,i| puts "#{i}:#{fruit}"}



# map目メソッドで繰り返し処理をしつつ、添字も同時に取得したい時はどうすればいいでしょうか。
fruits = ['apple','orange','melon']
fruits.map.with_index {|fruit,i|"#{i}:{fruit}"}


fruits = ['apple','orange','melon']

fruits.delete_if_with_index { |fruit,i| fruit.include?('a')&&i.odd? }


# 4.8.3添字を0以外の数値から開始させる

fruits = ['apple','orange','melon']

fruits.each.with_index(1){ |fruit,i| puts "#{i}:#{fruit}"}

fruits.map.with_index(10){|fruit,i|"#{i}:#{fruit}"}
# mapで処理しつつ、10から始まる添字を取得する

# ちなみにeach_with_indexメソッドには引数を渡せないため、
# each_with_index(1)ではなく、上のコードのように
# each.with_index(1)の形で呼び出す。




4.8.4



dimensions = [
    [10,20],
    [30,40],
    [50,60],
]

areas = []
dimensions.each  do |dimension|
    length = dimension[0]
    width = display[1]
    areas << length * width
end
areas






dimensions = [
    [10,20],
    [30,40],
    [50,60],
]

dimensions.each_with_index do |(length, widht),i|
    puts "length: #{length},width:#{width},i;#{i}"

end

4.8.5


numbers = [1,2,3,4]
sum = 0

numbers.each do |n; sum|
     sum = 10
     sum += n 
     p sum 
end

# ブロック変数を;で区切り、
# 続けて変数を宣言すると、
# ブロック内でのみ有効な独立したローカル変数を宣言することができます

# 1hで5ブロック

# 繰り返し処理以外でも使用されるブロック
# ブロックはここで紹介したように、配列やハッシュの繰り返し処理で利用されることが多いですが、
# それ以外での場面でもよく利用されます。

File.open("./sample.txt","w") do |file|
    file.puts("1行目のテキストです。")
    file.puts("2行目のテキストです。")
    file.puts("3行目のテキストです。")
end


a = [1,2,3]
a.delete(100) do
    'NG '
end

a.delete (100)  {'NG'}

names = ['田中','鈴木','佐藤']
san_names = names.map {|name|"#{name}さん"}
san_names.join('と')

names = ['田中','鈴木','佐藤']
names.map{|name|"#{name}さん"}.join('と')
mapメソッドの戻り値に対して、直接joinメソッドを呼び出すことができます。


# 配列をもっと上手に使いこなすために

# 配列には非常に豊富なapi（メソッド群）が揃っています。
# 手を動かす前にapiドキュメントに一通り目を通して使えそうなメソッドがないか探してみる。
# 使えそうなメソッドが見つかったらirbを起動して簡単なサンプルコードを動かして見よう。
# 本当にそのメソッドが自分の用途にあってかどうかの確認ができる
# こうしたプロセスを繰り返せば、短いコードで複雑な処理を実装できるようになる