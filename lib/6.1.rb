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





クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）

クープ[  ・]バ[ゲケ]ット
これだと区切りなし（一行目）にはマッチしていません


# 区切り文字の有無を許容する

今回のように~が一文字、またはなし。を表現するには？というメタ文字を使います。



クープ[ 　・]?バ[ケゲ]ット

区切り文字を簡易的に表現する


正規表現にはちょうど「任意の一文字」を表す.というメタ文字があります。
クープ.?バ[ケゲ]ット



rubyで動かしてみる
text = <<-TEXT
クープバゲットのパンは美味しかった。
今日はクープ バゲットさんに行きました。
クープ　バゲットのパンは最高。
ジャムおじさんのパン、ジャムが入ってた。
また行きたいです。クープ・バゲット。
クープ・バケットのパン、売り切れだった（><）
TEXT

text.split(/n\n/).grep(/クープ.?バ[ケゲ]ット/)



# ところで、正規表現は検索だけではなく、置換する場合にも非常に便利です
# というわけでここからは正規表現を使った置換処理を取り上げてみます


<select name="game_console">
<option value="wii_u">Wii U</option>
<option value="ps4">プレステ4</option>
<option value="wii_u">ゲームボーイ</option>
</select>

# selectタグの中身をCSVに変換してほしい
# つまり結果は以下
# (csvとはゲー竹田形式およびファイル形式の一つで、項目をカンマで区切って列挙したもの。)

wii_u,Wii U
ps4,プレステ4
gb,ゲームボーイ


# valueを抜き出す正規表現を考える

# というわけでまずoptionのvalueと正規表現を使って綺麗に抜き出す
# valueは次のようなパターンになっています
# value = ,ダブルクオート、英数字またはアンダースコアが一文字以上、ダブルクオート




直前の文字が一文字以上を表す場合は+というメタ文字
英数字またはアンダースコアは[a-z0-9]のように[]と-を使ってかけます

よって
value="[a-z0-9"]+ "のようにかけばok
"



# 表示テキスト("Wii U"やプレステ4など)を抜きだす正規表現を考えてみましょう。
# 難しそうに思えるかもしれませんが、ここでは単純にこう考えることにします
# >で始まり、何かしらの文字が続き、<で終わる
# 厳密にいうと>と<はタグの一部なので表示テキストではありませんが、今はとりあえずよしとしてください
# 何かしらの文字が続くというのは、本記事で紹介した.と+を使えば実現できます。
# つまり、表示テキストを抜き出すには正規表現は次のようになります。(<>はメタ文字ではない。ただの文字です。)

# >.+<
# 上の正規表現をRubularに貼り付けてみましょう。



?は直前も文字が一個、またはなし
.は、任意の位置文字を表す
+は直前の文字が一個以上
*は直前の文字が0個以上
()はマッチする部分をキャプチャする







# valueと表示テキストを抜き出す正規表現はわかりましたが、問題はこれからどうやってcsv形式に置換するか


# 今回のようなケースであれば、次のように処理するのが良いと思います

# 1.行全体にマッチする正規表現を作る
# 2.valueと表示テキストの部分をそれぞれ()で囲んでキャプチャする
# 3.キャプチャを利用して新しい文字列を組み立てる

1.行全体にマッチする正規表現を作る

まず行全体にマッチする正規表現を作ります

<option value="[a-z0-9_]+">.+<\/option>

