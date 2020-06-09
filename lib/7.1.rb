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
end

users = []
users << User.new('Alice','Ruby',20)
users << User.new('Bob','Pyson',30)

users.each do |user|
    puts !"氏名:#{user.full_name},年齢:#{user.age}"
end


