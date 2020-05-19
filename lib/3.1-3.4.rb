# クラスの名前はキャメルケースで、ファイル名はスネークケースでかく。
# 3.3.1

def fizz_buzz(n)
    if n % 15 == 0
        'Fizz Buzz'
    elsif n % 3 == 0
        'Fizz'
    elsif n % 5 == 0
        'Buzz'
    else
        n.to_s
    end
end

require 'minitest/autorun'

class FizzBuzzTest < Minitest::FileTest
    def test_fizz_buzz
        assert_epual '1',fizz_buzz(1)
        assert_epual '2',fizz_buzz(2)
        assert_epual 'Fizz',fizz_buzz(3)
    end
end


# puts fizz_buzz(1)
# puts fizz_buzz(2)
# puts fizz_buzz(3)
# puts fizz_buzz(4)
# puts fizz_buzz(5)
# puts fizz_buzz(6)
# puts fizz_buzz(15)