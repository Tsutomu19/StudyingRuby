
7.5 selfキーワード
Rubyにはインスタンス自信をあらわすselfキーワードがあります。
JavaやC#の経験者であればthisキーワードとほぼ同じものと考えて構いません。
メソッドの内部で他のメソッドを呼び出す場合は暗黙的にselfに対してメソッドを呼び出しています。
そのためselfは省略可能ですが明示的にselfをつけてメソッドを呼び出しても構いません。

以下はselfなしでnameメソッドを呼び出す場合と、self付きで呼び出す場合、それに加えて直後のインスタンス変数を参照する場合の3パターンで@nameの内容を参照しています。

class User 
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def hello
        #selfなしでnameメソッドを呼ぶ
        "Hello,I am #{name}."
    end
    
    def hi
        #self付きでnameメソッドを呼ぶ
        "Hi,I am #{self.name}."
    end

    def my_name
        # 直接インスタンス変数の@nameにアクセスする
        "My name is #{@name}"
    end
end

user = User.new('Alice')
user.hello
user.hi
user.my_name

上のコードではご覧の通り、nameもself.nameも@nameも同じ文字列"Alice"を返します。
この場合はどれも同じ結果になるので、これが正解と一つを選ぶことはできません。selfをつけたりつけなかったり、そのままインスタンス変数ひアクセスしたり、人によって書き方が異なるところだと思います。






# メソッドとクラスメソッドインスタンスメソッドが曖昧だった

def addition (a,b,c,d,e)
    puts a + b + c + d + e
end

# メソッドとは何かしらの処理をまとめ、その一連の処理に名前をつけたもの。を指します。



# クラスメソッド？インスタンスメソッド？


class Calculation
    def addition(a,b,c,d,e)
     puts a + b + c + d + e
    end
end

Calculation.addition(1,2,3,4,5)
#=>エラーになる


# クラスの中にあるメソッドを使用する


# どうすればいいのか。この時に使うのがクラスメソッドです。
# クラスメソッドの定義はメソッド名の前にself.を加え、呼び出す時にクラス名.メソッド名で呼び出します。


class Calculation
    def self.addition(a,b,c,d,e)
     puts a + b + c + d + e
    end
end

Calculation.addition(1,2,3,4,5)
# =>15


# インスタンスメソッドは？
# 結論から言うとクラスの中にメソッドを作成するとインスタンスメソッドになります。



class Calculation
    def addition(a,b,c,d,e)
     puts a + b + c + d + e
    end
end

calculation = Calculation.new()
calculation.addtion(1,2,3,4,5)
# =>15


