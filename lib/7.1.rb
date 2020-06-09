7.1　rubyはオブジェクト指向言語です。これまでStringクラスうやArrayクラスなど学んだ

7.1.1　改札機プログラム

umeda = Gate.new(:umeda)
mikuni = Gate.new(:mikuni)


ticket = Ticket.new(150)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>false


ticket = Ticket.new(190)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>true





# 7.1.2 この章で学ぶこと
# この章では以下のようなことを学びます

# ・オブジェクト指向プログラミングの基礎知識
# ・クラスの定義
# ・selfキーワード
# ・クラスの継承
# ・メソッドの公開レベル
# ・定数
# ・様々な種類の変数
# ・クラス定義ユアRubyの言語仕様に関する高度な話題







# 7.2 オブジェクト指向プログラミングの基礎知識
# ざっくりクラスを使うプログラミングと使わないプログラミングの違いについて説明



# どんなものがあるのか
# そのものはどんな性質の奴らなのか
# そのものはどんな動きができる奴らなのか
# そのものが実際に何をしているか
# の順番で読み解く

# 一言で言えばものに注目した考え方のこと






users = []
users << { first_name: 'Alice',last_name: 'Ruby',age:20 }
users << { first_name: 'Bob',last_name:'Python',age:30 }
users.each do |user|
    puts "氏名:#{user[:first_name]}#
    {user[:last_name]},年齢:#{user[:age]}"
end


# 氏名についてはメソッドを作っておくと、他にも氏名を使う場面が出てきた時にそもメソッドを裁量できますね。

# ユーザーのデータを作成
users = []
users << { first_name: 'Alice',last_name: 'Ruby',age:20 }
users << { first_name: 'Bob',last_name:'Python',age:30 }

# 氏名を作成するメソッド
def full_name(user)
    "#{user[:first_name]}#{user[:last_name]}"
end


# ユーザのデータを表示する
users.each do |user|
    puts "氏名:#{full_naem(user)},年齢:#{user[:age]}"
end



# ですがハッシュを使うとキーをタイプミスしたらnilが帰ってきてしまいます。

users[0][:first_name]

users[0][:first_mame]

# 他にもハッシュは新しくキーをい追加したり、内容を変更したりできるので脆くて壊れやすいプログラムになりがちです
# users[0][:country] = 'japan'
# 勝手に新しいキーを追加

# 大きなプログラムになってくると、ハッシュでは管理しきれない
# そこで登場するのがクラスです
# Userクラスという新しいデータ型を作り、そこにデータを入れたほうがより
# 堅牢なプログラミングになります


class User
    attr_reader :first_name, :last_name,:age

    def initialize(first_name,last_name,age)
        @first_name = first_name
        @last_name = last_name
        @age = age
    end
    # 氏名を作成するメソッド
    def full_name
        "#{first_naem}#{last_name}"
    end
end



users = []
users << User.new('Alice','Ruby',20)
users << User.new('Bob','Pyson',30)

users.each do |user|
    puts !"氏名:#{user.full_name},年齢:#{user.age}"
end

7.2.2　オブジェクト指向プログラミング関連の用語



# クラスは一種のデータ型です。
# オブジェクトの設計図とかオブジェクトの雛形と呼ばれます


# rubyではオブジェクトは必ず何らかのクラスに属しています。クラスが同じであれば、保持している属性や使えるメソッドは同じ。


# Alice Rubyさん、20才というユーザのオブジェクトを作成する
alice = User.new('Alice','Ruby',20)
bob = User.new('Bob','Python',30)
# とちらもfull_nameメソッドをもつが、保持しているデータが異なるので戻り値は異なる
alice.full_name
bob.full_name

このように、クラスを元にして作られたデータの塊をオブジェクトと呼びます。

場合によってはオブジェクトではなくインスタンスを呼ぶこともあります。
以下の文章はおなじ意味だと考えて問題ありません

これはuserクラスのオブジェクトです
これはuserクラスのインスタンスです


user = User.new('Alice','Ruby',20)
user.first_name
# このようなコードは以下のように説明される場合があります。
# 二行目でuserオブジェクトのfirst_nameメソッドを呼び出しています。
# ここでのfirst_nameメソッドのレシーバーはuserです。
# レシーバーは英語でかくとreceiverで受信者という意味です
# なのでレシーバはメソッドを呼び出された側というニュアンスを出したいときによく使われます


# オブジェクトインスタンスレシーバのような用語がプログラマ個人の好みや会話の文脈で使い分けられます






メソッド、メッセージ
オブジェクトが持つ動作や振る舞いをメソッドと呼びます
オブジェクトの動作をか振る舞いと呼ぶとすごく難しく聞こえるかもしれませんが


要するに何かの処理をひとまとめにして名前をつけ、なんども再利用できるようにしたものがメソッドです。



レシーバをメッセージをいう呼び方はsmalltslkというオブジェクト指向でよく使われている呼び方です。



状態（ステート）
オブジェクトごとに保持されるデータのことをオブジェクトの状態（もしくはステート）と呼ぶことがあります。


# 属性（アトリビュート、プロパティ）
# オブジェクトの状態は外部から取得したり変更したりできる場合があります。例えば以下のコードはuserの名前を外部から取得したり、変更したりしています。
class User
    # first_nameの読み書きを許可する
    attr_accessor :first_name
    # 省略
end
user = User.new('Alice','Ruby',20)
user.first_name
# first_nameを変更する
user.first_name = 'アリス'
user.first_name



# このようにオブジェクトから取得できるあたいのことを属性と呼びます。多くの場合、属性の名前は名詞になっています。



