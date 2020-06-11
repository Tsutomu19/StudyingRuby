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



