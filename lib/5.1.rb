# 配列と同様、ハッシュも利用頻度の高いオブジェクトです。本格的なruby
# プログラミングを書く上で避けて通ることはでき前ん。
# またシンボルは少し変わったデータ型で、多言語の経験者でも初めて見たと思う人がいるかもしれません。
# 最初は文字列でと混同してしまうかもしれませんが、こちらもやはり使用頻度が高いデータ型なのでしっかり理解していきましょう。

m 1.00
ft 3.28m
in 39.37m


# 長さの単位変換プログラミングの実行例
convert_length(1,'m','in')
convert_length(15,'in','m')
convert_length(35000,'ft','m')


# この章で学ぶこと

# ハッシュ

# ハッシュはキーと値の組合せでデータを管理するオブジェクトのことです。
# 他の言語では連想配列やディクショナリ、マップと呼ばれたりする場合もあります。
# ハッシュを作成する場合は以下のような構文を使います。


# からのハッシュを作る
{}

# キーと値の組合せを三つ格納するハッシュ
# {キー1 => 値1,キー2 => 値2,}
# ハッシュはHashクラスのオブジェクトになっています。

{}.class
=>Hash

{'japan' = > 'yen','us' => 'dollar','india' => 'rupee'}



# リテラル（literal)
# 人間語で書いたプログラムの元ネタ（ソースコード）
# の中に直接べた書きした文字とか数字とかのこと



{'japan'=> 'yen','japan'=> '円'}
# ハッシュリテラルで使う{}はブロックで使う{}と使っている記号が同じです。




# 5.2.1要素の追加、変更、取得

# ハッシュ[キー] = 値


currencies = {'japan' => 'yen','us'=> 'dollar','india'=> 'rupee'}
currencies['italy'] = 'euro'
currencies
# =>{"japan"=>"yen","us"=>"dollar","india"=>"rupee","italy"=>"euro"}



# すでにキーが存在していた場合は、値が上書きされます。




# eachメソッドを使うとキーと値の組合せを順にトリアスことができます。キーと値は格納した順に取り出されます。
# ブロック変数がキーと値でニコニなっている天に注意してください。


currencies = {'japan'=> 'yen','us'=> 'dollar','india'=>'rupee'}

currencies.each do |key,balue|
    puts "#{key} : #{malue}"
end


# ブロック引数を一つにするとキーと値が引数に格納されます。




currencies.each do |key_value|
    key = key_balue[0]
    value = key_value[1]
    purs "#{key}: #{malue}"
end

# 5.2.3 
# ハッシュの同値比較、要素の取得、要素の削除

a = {'x'=>1,'y'=> 2,'z'=>3}

b = {'x'=>1,'y'=>2,'z'=>3}
a == b
# 並び順が異なっていてもキーと値が全て同じならtrue
c = {'z'=>3,'y'=>2,'x'=>1}
a == c

d ={'x'=>10,'y'=>2,'z'=>3}
a ==d
# false

{}.size
# =>0
{'x'=>1,'y'=>2,'z'=>3}.size
# =>3

# deleteメソッドを使うと指定したキーに対応する要素を削除できます。戻り値は削除された要素の値です。

currencies = {'japan' => 'yen','us'=>'dollar','india'=>'rupee'}
currencies.delete('japan')
currencies
# {'us'=>'dollar','india'=>'rupee'}





# deleteメソッドで指定したキーがなければnilが帰ります。
# ブロックを渡すと、キーが見つからないときにブロックの戻り値をdeleteメソッドの戻り値にできます。
currencies = {'japan' => 'yen','us'=>'dollar','india'=>'rupee'}
currencies.delete('italy')
currencies.delete('italy'){|key|"Not found:#{key}"}
"Not found: italy"

# 次はシンボル











5.3
