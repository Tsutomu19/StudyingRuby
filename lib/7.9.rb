7.9 様々な種類の変数

ここまではローカル変数とインスタンス変数の二種類だけを使ってきましたが
Rubyではこれ以外のような変数です。


クラスインタンス
クラス変数
グローバル変数
Ruby標準の組み込み変数


これらの変数について以下で説明していきます。
ただし、いずれも使用頻度は少ないのでもし遭遇したらもう一度読み返すぐらいの気持ちで読んでもえばokです。


# 7.9.1 クラスインスタンス変数


# インスタンス変数は@から始まる変数です。

class Product 
    @name = 'Product'

    def self.name
        @name
    end
    def initialize(name)
        @name = name 
    end
# attr_reader :naemでもいいが、@nameのなかみを意識するためにあえてメソッドを定義する。
    def name 
        @name
    end
end

Product.name
product = Product.new('A great movie')
product.name
Product.name


上のコードには@nameが四箇所登場しています。

実は二種類の@nameに分かれます。

一つはインスタンス変数の@nameでもう日等はクラスインスタンス変数の@nameです。
見た目は同じですが、全く別のデータなのです、

コードの中にコメントでどれがどの変数なのかを記入します。




class Product
    @name = 'Product'


    def self.name
    @name
    end

    def initialize(name)
        @name = name 
    end

    def name 
        @name
    end
end

インスタンス変数はクラスをインスタンス化した際に、オブジェクトごとに管理される変数です。
一方、クラスインスタンス変数はインスタンスの作成とは無関係に、クラス自身が保持しているデータです。


クラス構文の直下やクラスメソッドの内部で@で始まる変数を操作するとクラスインスタンス変数にアクセスしていることになります。


ここに継承の考え方が入るとさらにややこしくなります。


class Product
    @name = 'Product'

    def self.name
        @@name
    end
    def initialize(name)
        @name = name
    end
    def name 
        @name 
    end

end

class DVD < Product
    @name = 'DVD'

    def self.name 
        @naem
    end

    def upcase_name

        @name.upcase
    end
end


Prodct.name
DVD.name

prodct = Product.new('A great movie')
production.name

dvd = DVD.new('An awesome film')
dvd.name
dvd.upcase_name 

Production.name 
DVD.name




# 残り40パーセント
# あと4日
# 60 / 4 ＝　15%/日

# 一日8時間だから
# 1時間で2%進む


# 7.9.2 クラス変数


クラスインタンス変数はインスタンスメソッドないで共有されることがなくスーパークラスとサブクラスでも共有され流ことが無い。
一方、Rubyにはクラスメソッド無いでもインスタンスメソッド内でも共有される変数も存在します。それがクラス変数です。クラス変数は@@some_valueのように、変数名の最初に@@を二つ重ねます。






class Product
    @@name = 'Product'

    def self.name
        @@name
    end
    def initialize(name)
        @@name = name
    end
    def name 
        @@name 
    end

end

class DVD < Product
    @@name = 'DVD'

    def self.name 
        @@naem
    end

    def upcase_name

        @@name.upcase
    end
end


Prodct.name
DVD.name

prodct = Product.new('A great movie')
production.name

dvd = DVD.new('An awesome film')
dvd.name
dvd.upcase_name 

Production.name 
DVD.name


@@nameはクラスメソッド内でもインスタンスメソッド無いでも共有されています。



7.9.3 グローバル変数と組み合わせ変数
Rubyにはもう一種、グローバル変数というタイプの変数があります。
グローバル変数は$some_valueのように、$で変数名を始めます。

グローバル変数はクラスの内部、外部を問わず、プログラムのどこからでも変更、参照可能。



$program_name = 'Awesome program'


class Program
    def initialize(name)
        $program_name = naem
    end

    def self.name 
        $program_name 
    end

    def name 
        $program_name
    end
end


Program.name 
program = Program.new('Super program')





極力組み込み変数の仕様は避け、他の人が理解しやすいコードをかくことを心がけましょう。


