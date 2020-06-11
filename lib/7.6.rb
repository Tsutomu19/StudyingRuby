7.6クラスの継承


さて、この説で説明数rのはクラスの継承です。
オブジェクト思考プログラミング時て浮かべるのは継承だ。と言う人も多い。



クラスの継承に関する用語を簡単に説明。
DVDクラスがProcuctクラスを継承するとき、ProductクラスのことDVDクラスのスーパークラスと呼びます

または親クラス。
逆にProductクラスから見ると、DVDクラスはProductクラスのサブクラスと呼びます


性質や概念が共通しているかどうか（つまりクラスの継承が適切かどうか）を
判断する方法の一つはサブクラスはスーパークラスの一種である。
サブクラス is a スーパークラス
を声に出して読んだときに違和感がないか確かめることです


これはis-aの関係と呼ばれます。


例えば販売管理を行うシステムで商品クラスがスーパークラス、DVDクラスがサブクラスだった場合。
DVDは商品の一種である。（DVD is aproduct)
と声に出しても違和感がない。


また、サブクラスはスーパークラスの性質を特化したもので、反対にスーパークラスはサブクラスの性質を汎化したものである、と言う関係も成り立ちます。
特化とは性質がより細かく具体的になること、汎化とは性質がより大雑把に抽象化されることです。

7.6.1 標準ライブラリの継承関係


まずRubyの標準ライブラリの継承できるスーパークラスは一つだけになります

継承関係の要点にいるのはBasicObjectクラスです。それをObjectkクラスが継承しています。
このことからStringクラスやArrayクラスは、Objectクラスとis-aの関係にある、つまりStringはObjectの一種でArrayもObjectの一種と言えます


# 7.6.2　デフォルトで継承されるBasicObjectクラスです。それをObjectkクラスが継承しています。
# この章のサンプルコードで使ったUserクラスのように、独自に作成下クラスはデフォルトでObjectクラスを継承しています。
# 例えば次のように中身を全くかあkないクラスを作成


class User
end


# このクラスにはメソッドを何一つ定義していませんがUserクラスのオブジェクトはto_sメソッドやnil?メソッドを呼び出すことができます。
user = User.new
user.to_s
# =><User:0x007f8f9286d598>
user.nil?
# =>false

これはUserクラスがObjectクラスを継承しているためです

User.superclass

user = User.new
user.methods.sort

# 7.6.3 オブジェクトのクラスを確認する


オブジェクトのクラスを調べる場合はclassメソッドを使います。

user = User.new
user.class
# =>User

instance_of?メソッドを使って調べることもできます。


user = User.new

user.instance_of?(User)

user.instance_of?(String)


user.instancd_of?(String)




user = User.new
# instance_of?はクラスが全く同じ出ないとtrueにならない
user.instance_of?(Object)
# is_a?はis-a関係にあればtrueになる
user.is_a?(User)

user.is_a?(Object)
# =>true
user.is_a?(BasicObject)
# true
user.is_a?(String)



おさらい

BasicObject

Object

String Numeric Array Hash



7.6.4 他のクラスを継承下クラスを作る

独自のクラスを定義する際はObjectクラス以外のクラスを継承することもできます。


Product

DVD



class Product
end

一方、DVDクラスはProductクラスを継承する必要があります。
Objectクラス以外のクラスを継承する場合は次のような構文を使います。

class DVD < Product 
end

7.6.5 superでスーパクラスのメソッドを呼びだす

ProductクラスとDVDクラスに属性を追加してみましょう。
Productクラスは商品名と価格と言う属性を持つことにします。

class Product 
    attr_reader :name, :price

    def initialize(name, price)
        @name = name 
        @price = price
    end
end
product = Product.new('A great monie', 1000)
product.name
product.price




class DVD < Product
    attr_reader :running_time

    def initialize(name,price,running_time)
        @name = name 
        @price = price 
        @running_time = running_time
    end
end
dvd = DVD.new('A great movie', 1000, 120)
dvd.name
dvd.price
dvd.running_time



メソッドのオーバーライド

サブクラスではスーパークラスと同名のメソッドを定義することで、
スーパークラスの処理を上書きすることができます。
これをメソッドのオーバーライドと言います。

to_sメソッドはオブジェクトの内容を文字列に変換して返すメソッドです。



class Product
    attr_reader :name, :price

    def initialize(name,price)
        @name = name 
        @price = price 

    end
end

class DVD < Product 
    attr_reader :running_time

    def initialize(name,price,running_time)
        super(name,price)
        @running_time = running_time
    end
end

product = Product.new('A great movie', 1000)
product.to_s 

dvd = DVD.new('An awesome film', 3000, 120)
dvd.to_s 


7.6.7 クラスメソッドの継承

クラスを継承すると、クラスメソッドも継承されます。


class Foo
    def self.hello
        'hello'
    end
end

class Bar < Foo 
end
# Fooを継承したBarでもクラスメソッドのhelloが呼び出せる 
Foo.hello 
Bar.hello 

