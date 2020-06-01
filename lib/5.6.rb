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
# ハッシュはto_aメソッドを使って配列に変換することができます。

currencies = {japan:'yen',us:'dollar',india:'rupee'}
currencies.to_a

反対に、配列に対してto_hメソッドを呼ぶと配列をハッシュに変換することができる。
この時ハッシュに変換する配列はキーと値の組み合わせごとに一つの配列に入り、それが要素の分だけ配列として並んでいる必要がある。

# 5.6.8ハッシュの初期値を理解する


# すでに説明した通り、ハッシュに対して存在しないキーを指定するとnilが返ります
h = {}
h:[:foo]
# =>nil

# nil以外の値を返したい時はHash.newでハッシュを作成し、引数に初期値となる値を指定します。
h = Hash.new('hello')
h[:foo]
# =>'hello'



# ただし配列の初期値と同様、ここでも参照の概念を理解して置かないと思わぬ不具合を作り込んでしまう可能性があります。
newの引数として初期値を指定した場合は、初期値として毎回同じオブジェクトが返ります。
そのため、初期値に対して破壊的な変更を適用すると、他の変数の値も一緒に変わってしまいます。
h = Hash.new("hello")
a = h[:foo]
b = h[:bar]

a.equal?(b)
# =>true


# 変数に破壊的な変更を適用すると変数bの値も一緒に変わってしまう。
a.upcase!
a
b
# =>"HELLO"
# =>"HELLO"
# ちなみにハッシュ自身はからのままになっている
h
# 文字列や配列など、ミュータブルなオブジェクトを初期値として返す場合はHash.newとブロックを組み合わせて初期値として返す場合は、
# このような問題を避けることができます。





# キーが見つからないとブロックがその都度実行され、ブロックの戻り値が初期値になる。
h = Hash.new{'hello'}
a = h[:foo]
b = h[:bar]


# 変数aと変数bは異なるオブジェクト(ブロックの実行時に毎回新しい文字列が作成される。)
a.equal?(b)
a.upcase!
a
# =>"HELLO"

b
# =>"hello"
h
# =>{}



またHash.newにブロックを与えると、ブロック引数としてハッシュ地震と見つからなかったキーが渡されます。
そこでこのブロック引数を使ってハッシュにキーと初期値も同時に設定するコードもよく使われます。

h = Hash.new {|hash,key|hash[key] = 'hello'}
h[:foo]
h[:bar]
h


# 5.7.1　シンボルを作成する様々な方法
作成する場合はコロンに続けて、変数名やクラス名、メソッド名の識別子として、有効な文字列を書きます。
:apple
:Apple
:ruby_is_fun
:okay?
:welcome!
:_secret
:$dollar
:@at_mark

# 5.7.2 %記法でシンボルやシンボルの配列を作成する

%s!ruby is fun!
%s(ruby is fun)
シンボルの配列を作成する場合はm%iを使うことができます。
この場合、空白文字がう要素の区切りになります。

# 5.7.3　シンボルと文字列の関係
文字列とシンボルは見た目は似ていても別物で互換性はありません。

stirng = 'apple'
symbol = :apple
string == symbol 
# =>false
string + symbol 
# TypeError

# ただしto_symメソッドを使うと、文字列をシンボルに変換することができます。
string = 'apple'
symbol = :apple

string.to_sym
# =>:apple
string.to_sym == symbol 
# true





# 繰り返しになりますが、
# ハッシュ
# シンボル
# は配列と同様によく使われます。
# 理解があやふやん人はこの賞を繰り返し読み、サンプルコードを自分の手で動かしてしっかりと知識を定着させましょう。

# 条件分岐や真偽値の扱いでよく使われる定番の書き方（イディオム）の紹介


# 国名に応じて通過を返す
def find_currency(country)
    currencies = {japan:'yen',us:'dollar',india:'rupee'}
    currencies[country]
end
# 指定された国の通過を大文字にして返す
def show_currency(country)
    currency = find_currency(country)
    # nilでないことをチェック
    if currency
        currency.upcase
    end
end
通過が見つかる場合と見つからない場合の結果を確認
show_currency(:japan)
show_currency(:brazil)