
# 2.10.4

country = 'italy'
if country == 'japan'
    'こんにちは'
    
elsif country == 'us'
    'Hello'
    
elsif country == 'italy'
    'ciao'
else
    '???'
    
end




# case文を使うとき
case country
when 'japan'
    'こんにちは'
when 'us'
    'Hello'
when 'italy'
    'ciao'
else
    '???'
end




country = 'アメリカ'
case country
when 'japan' '日本'
    'こんにちは'
when 'us','アメリカ'
    'Hello'
when 'italy','イタリア'
    'ciao'
else
    '???'
end


# message（変数）に結果を入れる

country = 'italy'
message =
case country
when 'japan'
    'こんにちは'
when 'us'
    'Hello'
when 'italy'
    'ciao'
else
    '???'
end
message　
# =>'ciao'





country = 'italy'

case country
when 'japan' then 'こんにちは'
when 'us' then 'Hello'
when 'italy' then 'ciao'
else '???'
end




# 2.10.5

n = 11
if n > 10
    '10より大きい'
else
    '10以下'
end


n = 11
n > 10 ? '10より大きい' : '10以下'


n = 11
message = n > 10 ? '10より大きい' : '10以下'
message

# 2.11.1　デフォルト値付きの引数

def greeting(country)
    if country == 'japan'
        'こんにちは'
    else
        'hello'
    end
end


greeting
greeting('us')
greeting('us','japan')







def greeting(country = 'japan')
    if country = 'japan'
        'こんにちは'
    else
        'hello'
    end
end


greeting

greeting('us')

# デフォルト値付きの引数の混在
def default_args(a,b,c = 0, d=0)
    "a=#{a},b=#{b},c=#{c},d=#{d}"
end
default_args(1,2)
default_args(1,2,3)
default_args(1,2,3,4)

def foo(time = Time.now,message = bar)
    puts "time:#{time}message:#{message}"
end

def bar
    'BAR'
end

foo








# 2.11.2

.empty?
'abc'.empty?
# 空文字列であればtrue


'watch'.include?('at')
'watch'.include?('in')
# 引数の文字列が含まれていればtrue



1.odd?
2.odd?

# 奇数ならtrue
# 偶数ならfalse



1.even? 
2.even?
# 奇数ならtrue


nil.nil?
'abc'.nil?
1.nil? 
# オブジェクトがnilであればtrue



def multiple_of_three?(n)
    n % 3 == 0
end
multiple_of_three?(4)
multiple_of_three?(5)
multiple_of_three?(6)

# ?で終わるメソッドは自分で定義することもできる
# 真偽値を返す目的のメソッドであれば、？で終わらせるようにした方が良い。


2.11.3