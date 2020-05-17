
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