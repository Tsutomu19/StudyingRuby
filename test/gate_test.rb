require 'minitest/autorun'
require './lib/gate'
require './lib/ticket'

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

# 子にテストシナリオでは出場できるという結果を期待しているので、juso.exit(ticket)の戻り値はtrueになるはず
# それを検証するために最後にassertメソッドで戻り値がtrueになることを検証していきます。


