7.10　クラス定義やRubyの言語仕様に関する高度な話題

何か困った時にこの節を読み返せるように内容をざっくりと頭のすみにとどめておく


7.10.1 エイリアスメソッドの定義

Stringクラスのsizeメソッドはlengthメソッドのエイリアスメソッドです。

エイリアスメソッドを定義する場合はaliasキーワードを呼び出す梅は先に元のメソッドを定義して置かないとエラーになります。

以下はhelloメソッドのエイリアスメソッドとしてgreetingメソッドを定義する例です。

class User

    def hello
        'Hello!'
    end

    alias greeting hello 
end

user = User.new
user.hello 
user.greeting 



7.10.2　メソッドの削除　
頻繁に使う機能ではありませんがrubyではメソッドの定義を後から削除することもできます。
メソッドの定義を後から削除することもできます。


class User 
    undef freeze 
end
user = User.new 

user.freeze 


7.10.3 ネストしたクラスの定義

クラス定義する場合、クラスの内部に別のクラスを定義することも出来ます。

class 外側のクラス
    class 内側のクラス
    end
end


7.10.4 演算子の挙動を独自に再定義する


Rubyでは＝で終わるメソッドを再定義することができます。=で終わるメソッドは変数に代入する形式でそのメソッドを呼ぶことができます。


class User
    def name = (value)
        @name = value
    end
end

user = User.new
user.name = 'Alice'