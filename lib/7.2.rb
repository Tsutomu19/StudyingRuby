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