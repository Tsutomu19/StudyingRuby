# puts 'Hello, world!'

# FizzBuzzプログラムの仕様は次のようになっていました。
# ・3で割り切れる数値を引数に渡すと、“Fizz”を返す。
# ・5で割り切れる数値を引数に渡すと、“Buzz”を返す。
# ・15で割り切れる数値を引数に渡すと、“FizzBuzz”を返す。・それ以外の数値はその数値を文字列に変えて返す。

def fizz_buzz(n)
    if n % 15 == 0
        'Fizz Buzz'
    elsif n % 3 == 0
        'Fizz'
    elsif n % 5 == 0
        'Buzz'
    else
        n.to_s
    end
end




# puts fizz_buzz(1)
# puts fizz_buzz(2)
# puts fizz_buzz(3)
# puts fizz_buzz(4)
# puts fizz_buzz(5)
# puts fizz_buzz(6)
# puts fizz_buzz(15)



# 文字列はシングルクオートやダブルクオートだけでなく、
# %記法で作ることもできます。%記法を使うとシングルクオートやダブルクオートをエスケープする必要がありません
# （ここでも改行やバックスラッシュの有無がわかりやすくなるよう、意図的にputsメソッドを使っています）。



#%q!!はシングルクオートで囲んだことと同じになるputs%q!Hesaid,"Don'tspeak."!#=>Hesaid,"Don'tspeak."#%Q!!はダブルクオートで囲んだことと同じになる（改行文字や式展開が使える）something="Hello."puts%Q!Hesaid,"#{something}"!#=>Hesaid,"Hello."

# 数値関連のクラスにはいくつか種類があります。たとえば整数であればIntegerクラス、小数であればFloatクラスになります








# 1 && 2 && 3
# 1 && nil && 3
# 1 && false && 3
# ご覧のとおり、3やnilといった値が式全体の戻り値になっています。Rubyは式全体が真または偽であることが決定するまで左辺から順に式を評価します。式全体の真または偽が確定すると、式の評価を終了し、最後に評価した式の値を返します。たとえば、1&&2&&3であれば、すべての式を評価する必要があったため、最後の式である3が戻り値になっています。一方、1&&nil&&3は2つめのnilを評価した時点で式全体の真偽値が偽であることが確定したため、そこで評価を終了し、nilを返します。

# 伊藤 淳一. プロを目指す人のためのRuby入門 言語仕様からテスト駆動開発・デバッグ技法まで (Software Design plus) (Japanese Edition) (Kindle の位置No.1738-1745). Kindle 版. 

# Aが真か　真でなければBせよとういう制御フローを実現する際に便利です。
# def greeting(country)
#     country or return 'countryを入力して下さい'

#     if country == 'japan'
#         'こんにちは'
#     else
#         'hello'
#     end
# end

# greeting(nil)
# greeting('japan')


# status = 'error'
# if status != 'ok'
#     '何か異常があります。'
# end

# status = 'error'
# unless status == 'ok'
# '何か異常があります。'
# else
#     '正常です'
# end



# # thenが使える。
# status = 'error'
# unless status == 'ok' then
# '何か異常があります'
# end

# status = 'error'
# if status !='ok'
#     '何か異常があります。'
# end