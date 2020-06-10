
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


