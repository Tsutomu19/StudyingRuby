7.1　rubyはオブジェクト指向言語です。これまでStringクラスうやArrayクラスなど学んだ

7.1.1　改札機プログラム

umeda = Gate.new(:umeda)
mikuni = Gate.new(:mikuni)


ticket = Ticket.new(150)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>false


ticket = Ticket.new(190)
umeda.enter(ticket)
mikuni.exit(ticket)
# =>true


7.1.2 この章で学ぶこと
この章では以下のようなことを学びます

・オブジェクト指向プログラミングの基礎知識
・クラスの定義
・selfキーワード
・クラスの継承
・メソッドの公開レベル
・定数
・様々な種類の変数
・クラス定義ユアRubyの言語仕様に関する高度な話題


7.2 オブジェクト指向プログラミングの基礎知識