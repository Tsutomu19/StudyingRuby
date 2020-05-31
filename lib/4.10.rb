numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
    puts n 
    break if n == 5
end
break を使うと、繰り返し処理を脱出することができます。


numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
    n = numbers[i]
    puts n
    break if n == 5
    i += 1
end



ret = 
while true
    break
end
ret

ret = 
while true
    break 123
end
ret

ret = 
while true
    break 123
end
ret


fruits = ['apple','melon','orange']
numbers = [1,2,3]
catch :done do
    fruits.each do |fruit|
        numbers.shuffle.each do |n|
            puts "#{fruit},#{n}"
            if fruit == 'orange'&& n ==3
                throw :done
            end
        end
    end
end

thow,catchというキーワードは他の言語では例外処理に使われる場合がありますが、Rubyのthrow,catchは関係ありません
Rubyではraiseとrescueを例外処理で使います。








fruits = ['apple','melon','orange']
numbers = [1,2,3]
catch :done do
    fruits.shuffle.each do |fruit|
        numbers.shuffle.each do |n|
            puts "#{fruit}, #{n}"
            if fruit == 'orange' && n == 3
                throw :foo
            end
        end
    end
end

ret = 
catch :done do
    throw :done
end
ret

ret = 
catch :done do
    throw :done, 123
end
ret

def greeting(country)
    return 'countryを入力してください'if country.nil?
    if country == 'japan'
        'こんにちは'
    else
        'hello'
    end
end



def  calc_with_break
    numbers = [1,2,3,4,5,6]
    target = nil
    numbers.shuffle.each do |n|
        target = n
        break  if n.even?
    end
    target  * 10
end
calc_with_break






def  calc_with_return
    numbers = [1,2,3,4,5,6]
    target = nil
    numbers.shuffle.each do |n|
        target = n
        return  if n.even?
    end
    target  * 10
end
calc_with_return
# => nil 




def calc_with_return
    numbers = [1,2,3,4,5,6]
    target = nil
    numbers.shuffle.each do |n|
        target = n
        return  if n.even?
    end
    target * 10
end
calc_with_return




[1,2,3].each do |n|
    puts n
    return
end
# => 1
# LocalJumpError


break と　returnは脱出するという目的は同じでもp繰り返し処理からの脱出とメソッドからの脱出という大きな違いがあるため、用途に応じて適切に使い分ける必要があリマス。
が冒頭でも述べたように、挙動が複雑になるので、積極的に活用するテクニックではありません


numbers = [1,2,3,4,5]
numbers.each do |n|
    next if n.even?
    puts n
end



繰り返し処理を途中で中断し、次の繰り返し処理に進める
場合はnextを使います。以下は偶数であれば処理を中断して次の繰り返し処理に進むコード例です

numbers = [1,2,3,4,5]
numbers.each do |n|
    next if n.even?
    puts n
end

# =>1
# 3
# 5






numbers = [1,2,3,4,5]
i = 0
while i < numbers.size
    n = numbers[i]
    i += 1
    next if n.even?
    puts n
end
# 偶数であれば中断して次の繰り返し処理に進む
# 1
# 4
# 6　間違えた。こうではないらしい。

1,3,5となる。




fruits = ['apple','melon','orange']
numbers = [1,2,3,4]
fruits.each do |fruit|
    numbers.each do |n|
        next if n.even?
        puts"#{fruit},#{n}"
    end
end


繰り返し処理をやり直したい場合はredoを使います。
ここでいうやり直しは初回からやり直すのではなく、その回の繰り返し処理の最初に戻る、という意味です



foods = ['ピーマン','トマト','セロリ']
foods.each do |food|
    print "#{food}は好きですか？=>"
    answer =  ["はい","いいえ"].sample
    puts answer
    # はいと答えなければもう一度聞き直す
    redo unless answer == 'はい'
end



foods = ['ピーマン','トマト','セロリ']
count = 0
foods.each do |food|
    print "#{food}は好きですか？=>"
    answer = 'いいえ'
    puts answer

    count += 1
    redo if answer != 'はい'  && count < 2

    count = 0
end



4.11のまとめ

# 配列
# ブロック
# 範囲
# 様々な繰り返し処理
# 繰り返し処理用の制御構造


# 配列やブロックはrubyに置いて利用頻度が高い機能です。今後も時々この賞を読み直して徐々に記憶を定着させていきましょう。
# 配列に用意された豊富なapiを使いこなせば使いこなすほど、簡素なrubyプログラムがかけるよになるはずです。
# 次はハッシュを学習。