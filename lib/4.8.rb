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





