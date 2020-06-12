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





# 7.7.3 privateメソッドはサブクラスでも呼び出せる


他にも注意するべき点があります。
他の言語ではprivareメソッドはそのクラスの内部でのみ呼び出せると言う場合がありますが、
privateメソッドはそのクラスだけでなくサブクラスでも呼び出せる（ruby)

class Product
    private

    def name 
        'A great movie'
    end
end

class DVD < Product
    def to_s
        # nameはスーパクラスのprivateメソッド
        name: "#{naem}"
    end
end

dvd = DVD.new

dvd.to_s

# 内部でスーパークラスのprivateメソッドを呼んでいるがエラーにならない
dvd.to_s 

ご覧の通り、サブクラスからでもスーパークラスのprivateメソッドを呼び出せています
Productクラスのコードだけを見るとnameメソッドはどこからも使われてないじゃないかと思うかもしれません
この場合だとnaemメソッドを削除するとDVDクラスのto_sメソッドでエラーが起きる




7.7.4 クラスメソッドをprivateにした場合

privateメソッドになるのはインスタンスメソッドだけです。
クラスメソッドはprivareキーワードの下に定義してもprivareになりません。

class user 
    private
    def self.hello
        'Hello!'
    end
end

user.hello
# =>Hello!

class User
    class << self
        private
        def hello
            'Hello!'
        end
    end
end
User.hello
# NoMethodError (private method `hello' called for User:Class)



class << self を使わない場合は
private_class_methodでクラスメソッドの定義語に公開レベルを変更することができます。


class User
    def self.hello
        'Hello'
    end
    private_class_method :hello
end

User.hello 
# NoMethodError (private method `hello' called for User:Class)


# このようにクラスメソッドはインスタンスメソッドを同じようにprivateキーワードの下に定義しても
# privateなクラスメソッドにはならない


