7.3 クラスの定義

rubyのクラスを定義する場合は次のような構文を使います
class クラス名
end




7.3.1　オブジェクトの作成をinitializeメソッド

クラスからオブジェクトを作成する場合は以下のようにnewメソッドを使います。
User.new
この時に呼ばれるのがinitializeメソッドです
インスタンスを初期化するために実行したい処理があれば、このiniitializeメソッドでその処理を実装します。
コンストラクタのようなものと考えるとわかりやすい。
次のようにnewメソッドを呼び出し他時にinitializeメソッドが呼ばれていることがわかります。


class User
    def initialize
        puts 'Initialized.'
    end
end
User.new
=>Initialized.

initializeメソッドは特殊なメソッドで、外部から呼び出すことはできません。

user = User.new
user.initialize
# =>NoMethodError: private metho 'initialize'




# initializeメソッドに引数をつけると、newメソッドを呼ぶ時にも引数が必要になります

class User
    def initialize(name,age)
        puts "name:#{name},age:#{age}"
    end
end
User.new
# => ArgumentError:wrong number of arguments(given 0,ezpected 2)
User.new('Alice',20)
# => name: Alice, age: 20

7.3.2 インスタンスメソッドの定義

# クラス構文の内部メソッドを定義すると、そのメソッドはインスタンスメソッドになります。
# インスタンスメソッドはその名の通り、そのクラスのインスタンスに対して、呼び起こすことができるメソッドです。


class User
    # インスタンスメソッドの定義
    def hello
        "Hello!"
    end
end

user = User.new
#インスタンスメソッドの呼び出し
user.hello
# =>"Hello!"

7.3.3 インスタンス変数とアクセサリメソッド
クラスの内部ではインスタンス変数を使うことができます。
インスタンス変数とは同じインスタンスの内部で共有される変数です。

インスタンス変数の変数名は必ず@で始めます
以下はインスタンス変数の使用例です。


class User
    def initialize(name)
        @name = name
    end

    def hello
        "Hello,I am #{@name}."
    end
end
user = User.new('Alice')
user.hello
# =>"Hello,I am Alice."


class User
    def hello
        shuffled_name = @name.chars.shuffle.join
        "Hello,I am #{shuffled_name}."
    end
end
user = User.new('Alice')
user.hello 









class User
    # 省略
    def hello
        "Hello,I am #{shuffled_name}."
    end
end
user = User.new('Alice')
# いきなりshuffled_nameを参照したのでエラーになる
user.hello
# =>NameError:undefined local variable or methid 'shiffled_name'


一方、インスタンス変数は作成（値を入力)する前にいきなり参照してもエラーになりません。まだ作成されていないインスタンス変数を参照してもエラーになりm戦。

class User
    def initialize(name)
        # @name = name
    end

    def hello
    end
end
user = User.new('Alice')
# =>@nameを参照するとnilになる(つまり名前の部分に何も出ない)
user.hello
# =>"Hello, I am ."

このためインスタンス変数名をうっかりタイプミスすると、思いがけない不具合の原因になります。

class User
    def iniilaize(name)
        @name = name
    end
    間違ってmameと書いてしまった
    def hello
        "Hello,I am #{@mame}."
    end
end
user = User.new('Alice')
user.hello


インスタンス変数はクラスの外部から参照することができません。
もし参照したい場合は参照ようのメソッドを作る必要があります。




class User
    def initialize(name)
        @name = name
    end

    def name 
        @name
    end
end
user = User.new('Alice')
# nameメソッドを経由して@nameの内容を取得する
user.name


同じく、インスタンス変数の内容を外部から変更したい倍も変更用のメソッドを定義します。
他の言語の経験者は驚くかもしれませんがRubyは=で終わるメソッドを定義すると、変数に代入するような形式でそのメソッドを呼び出すことができます。



class User
    def initialize(name)
        @name = name
    end

    def name
        @name
    end
    def name = (value)
        @name = value
    end
end
user = User.new('Alice')
user.name = 'Bob'
user.name 
# =>Bob


このようにインスタンス変数の値を読み書きするメソッドのことを
アクセサリメソッドと呼びます。他の言語では
ゲッターメソッドやセッターメソッドと呼ぶこともあります。



Rubyの場合、単純にインスタンス変数の内容を外部から読み書きするのであれば、attr_accessorというメソッドを
使って退屈なメソッド定義を省略することができます。
attr_accessorメソッドを使うと上記のコードは次のように書き換えられます。


class User
    # @nameを読み書きするメソッドが自動的に定義される
    attr_accessor :name
    def initialize :name
        @name = name
    end
    # nameメソッドやname=メソッドを明示的に定義する必要がない
end

user = User.new('Alice')
#@nameを変更する
user.name = 'Bob'
# @nameを参照する
user.name
# =>Bob

インスタンス変数の内容を読み取り専用にしたい場合はattr_accessorの代わりにattr_readerメソッドを使います


class User
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end
user - User.new('Alice')
user.name
# =>Alice
user.name = 'Bob'
# =>NoMethodError:undefined method 'name='for 



class User
    # 書き込み用のメソッドだけを自動的に定義する
    attr_write :name

    def initialize(name)
        @name = name
    end
end
user = User.new('Alice')
#@naemは変更できる
user.name = 'Bob'
# @nameは変更できる
user.name





7.3.4 