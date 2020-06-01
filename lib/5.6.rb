# 5.6ハッシュについてもっと詳しく



5.6.1ハッシュで使用頻度の高いメソッド


currencies = {japan:'yen',us:'dollar',india:'rupee'}
currencies.keys
# =>[:japan,:us,:india]



currencies = {japan:'yen',us:'dollar',india:'rupee'}
currencies.values
=>["yen","dollar","rupee"]


currencies = {japan:'yen',us:'dollar',india:'rupee'}
currencies.has_key?(:japan)
# =>true
currencies.has_key?(:italy)
# => false



# 5.6.2 **でハッシュを展開させる


h = {us :'dollar',india:'rupee'}
# 変数hのキーと値を++で展開させる
{japna:'yen',**h}
# => {:japan=>"yen",:us=>"dollar",:india=>"rupee"}
# **をつけない場合は構文エラーになる
{japan:'yen',h}


# 上のコードは++の代わりにmergeメソッドを使っても同じ効果が得られます。




# 5.6.3　ハッシュを使った擬似キーワード引数
# ハッシュを受け取ってキーワード引数のように見せるテクニックを擬似キーワード引数と呼びます。



def buy_burger(menu,options = {})
    drink = options[:drink]
    potato = options[:potato]
end
buy_burger('cheese',drink:true,potato:true)

# 特別な要件がない限り、擬似キーワード引数よりも文法レベルでruby本体がサポートしてくれるキーワード引数を使った方がメリットが大きいです
# ただし、擬似キーワード引数も新しい実行環境で使えなくなったわけではありません。昔からメンテナンスされているコードであれば、擬似キーワード引数を使い続けている
# メソッドもたくさんあると思います。その場合は、あ、これは擬似キーワード引数を使っているんだなと理解できれば完璧です。

5.6.6
def buy_burger(options = {},menu)
    puts options
end

buy_burger({'drink'=>true,'potato'=>false},'fish')

# メソッド呼び出しの{}を省略できる
puts("Hello")
puts 'Hello'

buy_burger {'drink'= >true,'potato' => false},'fish'
# エラーが出る。


# これは、ハッシュリテラルの{}がブロックの{}だとrubyに解釈されたため。
# しかしプログラマはブロックの　{}ではなくハッシュの{}としてコードを書いてしまっているため、rubyの構文エラーだと怒られていたのです。


# 5,6,7　ハッシュから配列へ、配列からハッシュへ


