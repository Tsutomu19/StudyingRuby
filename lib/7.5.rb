
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

7.5.2 selfのつけ忘れで不具合が発生するケース

ところが、値をセットするname = メソッドの場合は話が異なります。以下のコードをみてください。

class User
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def rename_to_bob
        name = 'Bob'
    end

    def rename_to_carol
        self.name = 'Carol'
    end

    def rename_to_dave
        @name = 'Dave'
    end
end
user = User.new('Alice')

user.rename_to_bob
user.name

user.rename_to_dave
user.name

# rename_to_boobメソッドだけリネームがちゃんとできずk"Alic"のままになっている
# なぜか？説明用んでもわからなかった。わからない。理解できない。






7.5.2クラスメソッドやクラス構文直下のself

クラス定義文内に登場するselfは場所によってそのクラスのインスタンス自身を表したりクラス自身を表したりします。以下のコードをみてください。

class Foo
    puts"クラス構文の直下のself:#{self}"

    def self.bar
        puts"クラスメソッド内のself: #{self}"
    end

    def baz
        puts "インスタンスメソッド内のself:#{self}"
    end
end

Foo.bar
foo = Foo.new
foo.baz

クラス構文の直下とクラスメソッド内でのselfはFooと表示されます。
このFooはFooクラス自身を表しています。一方インスタンスメソッド内でのselfは<Foo:0x007f9d7c0467c8>と表示されます。
これはFooクラスのインスタンスを表しています。

class Foo
    def self.bar
        self.baz
    end

    def baz
        self.bar
    end
end

Foo.bar

foo = Foo.new
foo.baz



7.5.3　クラスメソッドをインスタンスメソッドで呼び出す

クラスメソッドをインスタンスメソッドの内部から呼び出す場合は、次のように書きます。
クラス名.メソッド

class Product
    attr_reader :naem, :price

    def initialize(name,price)
        @name = name 
        @price = price
    end

    # 金額を整形するクラスメソッド
    def self.format_price(price)
        "#{price}円"
    end

    def to_s
        # インスタンスメソッドからクラスメソッドを呼び出す
        formatted_price = Product.format_price(price)
        "name: #{name},price: #{formatted_price}"
    end
end

product = Product.new('A great movie' 1000)
product.to_s



# クラス名.メソッドの形式でクラスメソッドを呼び出す
Product.format_price(price)

# self.classメソッドの形式でクラスメソッドを呼び出す
self.class.format_price(price)