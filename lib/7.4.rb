
# 7.4　改札機プログラム
# 改札機オブジェクトの作成
umeda = Gate.new(:umeda)
mikuni = Gate.new(:mikuni)

# 150円の切符を購入して梅田で乗車し、三国で降車する(NG)
ticket = Ticket.new(150)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>false


# 190円の切符を購入して梅田で乗車し、三国で降車する(OK)
ticket = Ticket.new(190)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>true




# 7.4.1　テストコードを準備する
# 7.4.2　必要なメソッドやクラスを仮実装する


# class Gate
#     def initialize(name)
#         @name = name
#     end
# end

GateTest#test_gate:
NameError: uninitialized constant GateTest::Ticket
=>
# GateTest::Ticketをいう定数が見つかりません。という意味
# わかりやすくいうと,Ticketクラスが見つかりません。という意味
# Rubyクラス名も定数の一つなので、エラーメッセージも定数が見つからないという内容になります。
# なのでTicketクラスを作成。

# test/gate_test.rb:9:in `test_gate'



GateTest#test_gate:
# NoMethodError: undefined method `enter' for #<Gate:0x00007fbf4103fd38 @name=:umeda>
    # test/gate_test.rb:11:in `test_gate'


# エラーメッセージは変わりました。
# 今度はGateクラスにenterメソッドが定義されていません。という内容。
# 実際定義していないので当然。
# というわけでenterメソッドを実装します。
# ただしテストをパスさせるだけの単純な仮実装にして起きます。


7.4.3　運賃が足りているかどうかを判別する

二つ目のテストシナリオは出場できないパターン




class Gate
    def initialize(name)
        @name = name
    end

    def enter(ticket)
        ticket.stamp(@name)
    end

    def exit(ticket)
        true
    end
end

# Gateクラスのenterメソッドを実装します。ここではTicketクラスのstampメソッドを
# 呼び出し、自分お駅名を渡します。



class Ticket
    attr_reader :fare, :stamped_at

    def initialize(fare)
        @fare = fare
    end

    def stamp(name)
        @stamp_at = name
    end
end





# また運賃から(fare)と乗車駅(stamped_at)が外部から取得できるようにゲッターメソッドを追加しておきマウs。


class Gate
    STATIONS = [:umeda, :uso, :mikuni]
    FARES = [150,190]
    def initialize(name)
        @name = name
    end

    def enter(ticket)
        ticket.stamp(@name)
    end

    def exit(ticket)
        true
    end

    def calc_fare(ticket)
        from = STATIONS.index(ticket.stamped_at)
        to = STATIONS.index(@name)
        distance = to - from
        FARES[distance - 1]
    end
end

# 続いて、Gateクラスのexitメソッドを実装します。
# ここでは乗車駅と自分の駅名から適切な運賃を割り出せるようにする必要があります。

# 運賃を配列として用意する
# 駅名も配列として用意する。
# 駅名の配列から乗車駅と降車駅を検索しその添字を取得する
# 降車駅ー乗車駅で区間の長さを取得する
# 区間の長さ-1で適切な運賃を取得する


# indexメソッドは配列のなかから引数に合致するようsの添字を取得するメソッドです。
[:umeda,:juso, :mikuni].index(:juso)
# => 1



# 7.4.4　テストコードのリファクタリング


class GateTest < Minitest::Test
    def test_gate
        umeda = Gate.new(:umeda)
        juso = Gate.new(:juso)
        
        ticket = Ticket.new(150)
        umeda.enter(ticket)
        assert juso.exit(ticket)
    end
    
    def test_umeda_to_mikuni_when_fare_is_not_enough
        umeda = Gate.new(:umeda)
        mikuni = Gate.new(:mikuni)

        ticket = Ticket.new(150)
        umeda.enter(ticket)
        refute mikuni.exit(ticket)
    end
end



コードを見ると気になる店が二つあります。
人うめはテストメソッドの名前に一貫性がないこと。もう一つはこのままいくとGat4eオブジェクトの作成が毎回必要になることです。
最初にテストメソッドの名前を修正しましょう。
一つ目のテストシナリオで作成したtest_gateメソッドを次のように変更してください。
def test_umeda_to_juso

end
test_umeda_to_juso_when_fare_is_enouguとしてもいいのですが運賃が足りない
場合のテストケースは作れないのでここでは_when以降の名前は省略することにしました。
続いてGateオブジェクトの作成を共通化しましょう。
Minitestではsetupメソッドを定義すると、テストメソッドの実行前に毎回setupメソッドが呼び出されます。
そこでGateオブジェクトはsetupメソッドで作成し、かくgateメソッドをインスタンス変数に格納することにします。
かくテストメソッドではローカル変数の代わりにこのインスタンス変数を使います。


7.4.5　残りのテストケースをテストする

実装コードが正しければ三つ目と4つ目のテスト縛りおはGateクラスやTicketクラスの変更なしでパスするはずです。
テストシナリオはそれぞれ以下の通りでした。
