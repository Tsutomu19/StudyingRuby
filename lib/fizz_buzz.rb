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
puts fizz_buzz(1)
puts fizz_buzz(2)
puts fizz_buzz(3)
puts fizz_buzz(4)
puts fizz_buzz(5)
puts fizz_buzz(6)
puts fizz_buzz(15)



# 文字列はシングルクオートやダブルクオートだけでなく、
# %記法で作ることもできます。%記法を使うとシングルクオートやダブルクオートをエスケープする必要がありません
# （ここでも改行やバックスラッシュの有無がわかりやすくなるよう、意図的にputsメソッドを使っています）。



#%q!!はシングルクオートで囲んだことと同じになるputs%q!Hesaid,"Don'tspeak."!#=>Hesaid,"Don'tspeak."#%Q!!はダブルクオートで囲んだことと同じになる（改行文字や式展開が使える）something="Hello."puts%Q!Hesaid,"#{something}"!#=>Hesaid,"Hello."

# 数値関連のクラスにはいくつか種類があります。たとえば整数であればIntegerクラス、小数であればFloatクラスになります

