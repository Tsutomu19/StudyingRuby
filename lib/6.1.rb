# 6.1　イントロダクション

# 正規表現はパターンを指定して文字列検索や痴漢を行う一種のミニ言語です。
# rubyで正規表現を使えるようになるためには、rubyにおける正規表現オブジェクトの使い方と正規表現そのもの使い方
# を習得しておく必要があります。
# もし両方とも知らないという人にとっては、後者の方がハードルが高いかもしれません。ですが、正規表現は非常に便利ですし、一度覚えてしまえば他のプログラミング言語でも使えます。
# 本書では正規表現そのもの使い方をしれないという人にとっても、ある程度理解できるように説明して行きます。

# 6.1.1
ハッシュ記法変換プログラム

シンボルをキーとする場合のハッシュの書き方を２通り説明しました。具体的には=>と使う方法と
:と右側につける記法の二種類です。



{
    :name =>'Alice',
    :age => 20,
    :gender => :female
}




# =>を使わない記法

{
    name:'Alice',
    age: 20,
    gender: :female
}


# 6.1.2 ハッシュ記法変換プログラムの実行

old_syntax = <<TEXT
{
    :name =>'Alice',
    :age=>20,
    :gender => :female

}
TEXT

conbert_hash_syntax(old_syntax)
# =>
# {
#     :name =>'Alice',
#     :age=>20,
#     :gender => :female

# }





# ヒアドキュメントとは一言でいうと、文字列をプログラミングに埋め込むためのもの
# 普通の文字列の表現と違い、開業も埋め込むことができるので、より柔軟に文字列を扱うことができます。


# 特にrubyの場合、開業は普通だと分の終了だと見なされるがヒアドキュメントによって開業した複数行の文字列をプラグラムに使用することができます。














# 6.1.3　この章で学ぶこと
# 正規表現そのものについて
# rubyで正規表現を使えるようになるためには、rubyにおける正規表現オブジェクトの使い方と正規表現そのもの使い方













# 6.2　正規表現ってなに？



# 正規表現(regular epression)とは文字列の集合を一つの文字列で表現する方法の一つである。




# 筆者なりに正規表現を説明するなら、『パターンを指定して、文字列を効率よく検索/置換するためのミニ言語』

# 墓のプログラミング言語ではRegexと略される場合もあります。







# 6.2.1 正規表現の便利さを知る

I love Ruby.
Python is great language.
Java and JavaSqript are diffrent.


# もしこの中から、プログラミング言語っぽい文字列を抜き出すプログラミングをかけと言われたらどうしますか？
# 正規表現を使えばすぐできそうだとと思う。


text =<<TEXT
I love Ruby.
Python is great language.
Java and JavaSqript are diffrent.
TEXT
text.scan(/[A-Z][A-Za-z]+/)
# => ["Ruby", "Python", "Java", "JavaSqript"]


# 正規表現の文法をわかっていればこの呪文の意味がわかりますし、ゼロから自分で書くこともできます。


text =<<TEXT
私の郵便番号は12345667です。
僕の住所は6770056　兵庫県西脇市板波町1234だよ。
TEXT
puts text.gsub(/(\d{3})(\d{4})/,'\1-\2')


# ここでは、すごいすごい。使いこなしたい。とモチベーションをあげる。











# qitta記事








# \dはせいき方言では特別な意味と持ちます。
# こういった特別な文字をメタモジと呼びます。

# \dは一個の半角数字を意味するメタ文字です。
# 文字の集合を表しているので、特に文字クラスと呼ばれます。
# 普通の検索であれば\dは
# "\d"という文字列そのものを検索しますが、せいき業源では\dはいこの半角数字を検索します。
# 今後、正規表現中に\dが出てきたら、あ、これは半角数字を意味しているんだなと頭の中で意味を変換してくだい。




# rubyのコード上で動かしてみる

text = <<-TEXT
名前:伊藤淳一
電話:03-1234-5678
住所:兵庫県西脇市板波町1-2-3
TEXT
text.scan /\d\d-\d\d\d\d-\d\d\d\d/




text = <<-TEXT
名前：伊藤淳一
電話：03-1234-5678
電話：090-1234-5678
電話：0795-12-3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3
TEXT
text.scan /\d\d-\d\d\d\d-\d\d\d\d/

先ほどの正規表現だと正しく検索できない
これらの4つの電話番号にはどんな法則があるでしょうか？
正規表現を使うときは、最初に検索対象文字列の法則を上手く見つけ出すのが大切です。

今回であれば次のような法則があると言えそうです。
半買う数字が2-5こ、ハイフン、半角数字が1-4こ、ハイフン、半角数字が4個

あとはこれを正規表現として表すことができればokです。
文字の個数を限定するときは{n,m}や{n}というメタ文字を使います。（量指定子）
{n,m}は直前の文字がnこ以上、m恋かの意味です
また{n}とすればちょうどn文字の意味になります。



よって正規表現は以下のようななる
\d{2,5}-\d{1,4}-\d{4}


名前：伊藤淳一
電話：03(1234)5678
電話：090-1234-5678
電話：0795(12)3456
電話：04992-1-2345
住所：兵庫県西脇市板波町1-2-3




# 当然、カッコを使った電話番号は検索に失敗する

# AまたはBのいずれか一文字を表す場合は[AB]と書きます(文字の集合を表すので、これも文字クラスの一種です。)
# []の中に文字制限はない。
# [ABC]とかけばAまたはBまたはCのいずれか一文字の意味になります。


\d{2,5}[-(]\d{[1,4}[-)]\d[{4}

# [-(]
# ＝＞　-　　か　　(　　かという意味


[]中のハイフンは注意が必要

[a-z]「aまたはbまたはcまたは・・・yまたはz」の意味になるのです。
[-az]であh意味が異なる






