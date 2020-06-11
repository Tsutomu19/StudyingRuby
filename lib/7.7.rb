7.7 メソッドの公開レベル

Rubyのメソッドには以下のように三つの公開レベルがあります。


public 
protected
private 


7.7.1 publicメソッド

publicメソッドはクラスの外部からでも自由に呼び出せるメソッドです。initializeメソッド以外の
インスタンスメソッドはデフォルトでpublicメソッドになります。


class User
    # デフォルトはpublic
    def hello
        'Hello!'
    end
end
user = User.new
# publicメソッドなのでクラスの外部から呼び出せる
user.hello
# =>"Hello!"



7.7.2 privateメソッド
次にprotectedメソッドは一旦飛ばして、privateメソッドの説明
クラスの外からは呼び出せず、クラスないでprivateキーワードをかくと
そこから下で定義されたメソッドはprivateメソッドになります。


class User
    private
    def hello 
        'Hello!'
    end
end
user = User.new

user.hello
# NoMethodError (private method `hello' called for #<User:0x00007fcfea86b160>)
# 外部からは呼び出せない


class User
    def hello
        # nameメソッドはprivateなのでselfをつけるとエラーになる
        "Hello, I am #{self.name}."
    end

    private 

    def name 
        'Alice'
    end

    user = User.new 
    user.hello 
end
# 反対にselfを省略して呼び出すとエラーは発生しません。