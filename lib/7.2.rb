users = []
users << { first_name:'Alice',last_name:'Ruby',age:20 }
users << { first_name:'Bob',last_name:'Python',age:30 }


users.each do |user|
    puts "氏名: #{user[:first_name]}#{user[:last_name]}、年齢:#{user[:age]}"
end

# user[:first_name]の部分は
シンボルで書いてる





users = []
users << { first_name:'Alice',last_name:'Ruby',age:20 }
users << { first_name:'Bob',last_name:'Python',age:30 }

def full_name(user)
    "#{user[:first_name]}#{user[:last_name]}"
end

users.each do |user|
    puts "氏名:#{full_name(user)}、年齢:#{user[:age]}"
end

# 氏名:AliceRuby、年齢:20
# 氏名:BobPython、年齢:30

users[0][:first_name]
# users[0][:first_mame]
# nil
ハッシュだとタイプミスしてもnilが変えるだけなので不具合を気づきにくい


class User
    attr_reader :first_name, :last_name, :age
    
    def initialize(first_mame,last_name,age)
        @first_mame = first_name
        @last_name = last_name
        @age = age
    end
    
    def full_name
        "#{first_name}#{last_name}"
    end
end
users = []
users << User.new('Alice','Ruby',20)
users << User.new('Bob','Python',30)

users.each do |user|
    puts "氏名:#{user.full_name},年齢:#{user.age}"
end


# クラスはこのように、内部にデータを保持し、
# さらに自分が保持しているデータを利用する独自のメソッドを持つことができます。
# データとそのデータに関するメソッドが常にセットになるのでクラスを使わない場合に比べてテータとメソッドの整理がしやすくなります。



7.3
class User

end

class OrderItem

end

User.new
この時呼ばれるのがinitializeメソッドです。
インスタンスを初期化するために実行したい処理があれば、
このinitializeメソッドでその処理を実行します。

class User
    def initialize
        puts 'Initialized'
    end
end

User.new

user = User.new
user.initialize
# =>NoMethodError

class User
    def initialize(name,age)
        puts "name:#{name},age:#{age}"
    end
end
User.new
# Error

User.new('Alice',20)



class User
    def hello
        "Hello"
    end
end

user User.new
# => "Hello"




class User
    def initialize(name)
        @name = name
    end
    
    def hello 
        "Hello,I am  #{@name}"
    end
end
user = User.new('Alice')
user.hello


class User
    def hello
        # shuffled_name = @name.chars.shuffle.join
        "Hello,I am #{shuffled_name}."

    end
end

user = User.new('Alice')
user.hello




クラスに関連は深いものの、一つ一つのインスタンスに含まれるデータは
使わないメソッドを定義したい場合もある。
そのような場合はクラスメソッドを定義した方が使い勝手がよくなります。
クラスソッドの定義の仕方は以下

class  クラス名
    def self.クラスメソッド
        # 処理
    end
end

もう一つの書き方
class クラス名
    class << self
        def クラスメソッド
        end
    end
end

