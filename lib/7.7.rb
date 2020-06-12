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



7.8　定数についてもっと詳しく

定数はクラスの外部から直接参照することも可能です。クラスの外部から定数を参照する場合は次のような構文を使います。


クラス名::定数名

以下はクラスの外部から定数を参照するコード例です。

class Product
    DEFAULT_PRICE = 0
end

Product::DEFAULT_PRICE


定数をクラスの外部から参照させたくない場合はprivate_constantで定数名を指定します。

ですが、rubyの場合は何か特別な理由がないかぎりわざわざ　privateにすることは少ないと思います。



class Product
    DEFAULT_PRICE = 0
    # 定数をprivateにする
    private_constant :DEFAULT_PRICE
end

Product::DEFAULT_PRICE
# NameError (private constant Product::DEFAULT_PRICE referenced)
class Product
    def foo
        # メソッド内部で定数を作成すると構文エラーになる
        DEFAULT_PRICE = 0
    end
end
# SyntaxError




7.8.1　定数と再代入


さて、ここからはまた他の言語の経験者が少しびっくりするような説明をしていきます。

Rubyの定数はみんなわざわざ変更するなよと周りに念を押した変数のようなものです。

そのままの状態では定数を色々と変更できてしまいます。

まず、定数には再代入が可能です。なので定数の値を後から書き換えることができます。







class Product
    DEFAULT_PRICE = 0
    DEFAULT_PRICE = 1000
end

Procuct::DEFAULT_PRICE = 3000

Procuct::DEFAULT_PRICE



ご覧の通り定数はすでに初期化済みであると警告は表示されますが、再代入自体は成功してしまいます。
クラスの外部からの再代入を防ぎたいたい場合はクラスをfreezeします。こうすると
クラスは変更を受け付けなくなります。



Product.freeze
Procuct::DEFAULT_PRICE = 5000



ですがRubyの場合、普通は定数を上書きする人はいないだろうと言うことで、わざわざクラスを
freezeさせることは少ない。と思います。



class Product
    DEFAULT_PRICE = 0
    freeze 
    DEFAULT_PRICE = 1000
end


# 7.8.2　定数はミュータブルなオブジェクトに注意する


次に再代入をしなくてもミュータブルなオブジェクトあれば定数の値を変えることができます。
ミュータブルなオブジェクトがあれば定数の値を変えることができます。

ミュータブルなオブジェクトとは、例えば文字列や配列、ハッシュなどです




class Product
    Name = 'A product'
    SOME_NAMES = ['Foo','Bar','Baz']
    SOME_PRICES = {'Foo' => 1000,'Bar'=> 2000,'Baz'=>3000}
end

# 文字列を破壊的に大文字に変更する
Product::NAME.upcase!
Product::NAME

# 配列に新しい要素追加する
Product::SOME_NAMES << 'Hoge'
Product::SOME_NAMES

# ハッシュに新しいキーと値を追加する
Product::SOME_PRICES['Hoge'] = 4000
Product:SOME_PRICES


ご覧の通り、定数のなかみが変更されてしまいました。
上のコードは定数を直後変更しているので見た目にも定数にも定数を変更していると言うことが
明らかですが定数の値を変数に代入してしまうと定数を変更していることに気づ来にくくなります。


class Product
    SOME_NAMES = ['Foo','Bar','Baz']

    def self.names_without_foo(names = SOME_NAMES)
        names.delete('Foo')
        names
    end
end

Product.names_without_foo

Product::SOME_NAMES




class Product
    # 配列を凍結する
    SOME_NAMES = ['Foo','Bar','Baz'].freeze
    def self.names_without_foo(names = SOME_NAMES)
        # freezeしている配列に対しては破壊的な変更はできません
        names.delete('Foo')
        names
    end
end
# エラーが発生するのでうっかり定数の値が変更される事故が防げる
Product.names_without_foo

しかし上のコードもまだ完璧ではありません。配列やハッシュをfreezeすると配列やハッシュそのものへの変更は防止できますが配列やハッシュの各要素はfreezeしません。
よって、次のようなコードをかくと定数の内容はやはり変更されてしまいます。




class Product
    # 配列を凍結されるが中身の文字列はfreezeされない
    SOME_NAMES = ['Foo','Bar','Baz'].freeze
end
# 1番目の要素を破壊的に大文字に変更する
Product::SOME_NAMES[0].upcase!
# 1番目の要素の値が変わってしまった。
Product::SOME_NAMES
# => ["FOO", "Bar", "Baz"]


この事故も防ぎたいとなると各要素の値も別途freezeする必要があります。

class Product
    # 中身の文字列もfreezeする
    SOME_NAMES = ['Foo'.freeze,'Bar'.freeze,'Baz'.freeze].freeze

end
# 今度の中身もfreezeしているので破壊的な変更はできません。
Product::SOME_NAMES[0].upcase!




なお、次のようにmapメソッドを使うと、freezeをなんども書かずにすみます。



SOME_NAMES = ['Foo','Bar','Baz'].map(&:frreze).freeze


配列やハッシュの中身まで全てfrrezeするのは少し大変かもしれません。プログラムの規模や要件に応じて、freezeを適用するレベルを検討してください。
