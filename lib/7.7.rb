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


7.7.5 privateメソッド先に定義する場合

privateキーワードの下に定義したメソッドがprivateメソッドになるように
publicキーワードの下に定義したメソッドはpublicメソッドやpublicメソッドを好きな順番で定義することができます。

class User
    private

    def foo

    end

    public

    def bar

    end
end

ですが通常はprivateキーワードを使うのは1回だけにして、クラスの最後の方にprivateメソッドの定義をまとめることの方が多いです。


7.7.6 後からメソッドの公開レベルを変更する場合

privateキーワードは実際にはメソッドなので、引数を渡すことができます。
既存のメソッド名をprivateキーワード(privateメソッド)に渡すと、
そのメソッドがprivateメソッドになります。
また、引数を渡した場合はその下に定義下メソッドの公開レベルは変更されません。


class User
    一旦publicメソッドとして定義する
    def foo 
        'foo'
    end
end

def bar
    'bar'

end

private 


def baz
    'baz'
end


user = User.new
user.foo
user.bar



user.baz



7.7.7 protectedメソッド

さて、最後に登場するのはprotectedメソッド
protectedメソッドはそのメソッドを定義したクラス自身を、そのサブクラスのインスタンスメソッド
からレシーバ付きでと言うところです。
ポイントはレシーバ付きでと言うところです。

rubyの場合、そのクラス自身とサブクラスから呼び出せると言うだけではprivateメソッド
との違いがありません。

とはいえ、この説明だけ聞いてもピンとこない遠見ますので
具体的なコードを使いながら説明しましょう。

例えば名前と体重を持つuserクラスがあったとします。ただし体重を公開するのは恥ずかしいので外部かr取得できるのは
名前だけにします。



しかし、何らかの理由でユーザ同士の体重を比較しなければならなくなりました。と言う
訳で次のようなメソッドを定義します。

class User
    def heavier_than?(other_user)
        other_user.weight < @weight
    end
end



このままだとother_userの体重では取得できないのでエラーになります。

alice = User.new('Alice',50)
bob = User.new('Bob',60)
# 取得できない。
alice.heavier_than?(bob)


weightをpublicメソッドとして公開してしまうとother_userの体重を取得できますが、
一方で自分の体重も外部から取得可能になってしまします。
かといってprivateメソッドにすると、レシーバ付きで呼び出せないので、other_user.weightのような
形式で呼び出そうとするとエラーになってしまいます。

このように外部には公開したくないが、同じクラスやサブクラスのなかであればレシーバ付きで呼び出せるようにしたい、と言う時に登場するのがprotectedメソッドです。


clss User
def heavier_than?(other_user)
    other_user.weight < @weight
end

protected 


def weight
    @weight
end

alice = User.new('Alice',50)
bob = User.new('Bob'60)

同じクラスのインスタンスメソッドないであればweightが呼び出せる

alice.heaver_than?(bob)
bob.heavier_than?(alice)


# クラスの外ではweightは呼び出せない。
alice.weight


ご覧の通り、体重の一般公開を避けつつ、仲間の中でのみ他のオブジェクトに公開することができました。

なお単純なターゲットメソッドであれば次のようにして、weightメソッドだけを後からprotectedメソッドに変更した方がシンプルかもしれません。


class User
    # 一旦publicメソッドとして、weightを定義する
    attr_reader :name, :weight
    # weightのみ、後からprotectedメソッドに変更する
    protected :weight

    # 省略
end


とはいえpublicメソッドとprivateメソッドに比べるとprotectedメソッドが登場する機会はずっと少ないようにおもいます。



このように、Rubyにおけるpuublic,protected,privateは用語こそ他の言語（java,C#など）に
似ているものの仕様は異なるので他の言語の経験者は過去の常識にとらわれないようにしてください。


# colum
継承したら同盟のインスタンス変数に注意
privateメソッドはサブクラスでも呼び出せるの項ではRubyのprivateメソッドはサブクラスでも呼び出せるため、スーパークラスの実装を理解していないと、うっかり同じ名前のメソッドを定義してスーパークラスの動きに悪影響を及ぼすと言う説明をしました。
これと同じ問題はインスタンス変数でも起こります。インスタンス変数もスーパークラスをサブクラスで共有されるため
スーパークラスの実装を下図に偶然同じ名前のインスタンス変数を定義するとバグの要因になってしまう

