# 5,5,1
# 5,5,2　いろんなん単位を変換できるようにする
# 5,5,3　メソッドを改善

require 'minitest/autorun'
require './lib/convert_length'
class ConvertLengthTest < Minitest::Test
    def test_convert_length
        assert_equal 39.37,convert_length(1,from: :m, to: :in)
        assert_equal 0.38,convert_length(15,from: :in,to: :m)
        assert_equal 10670.73,convert_length(35000,from: :ft,to: :m)
    end
end



units = {'m'=>1.0,'ft'=>3.28,'in'=>39.37}



# def convert_length(length,unit_from,unit_to)
#     units = {'m'=>1.0,'ft'=>3.28,'in'=>39.37}
#     (length/units[unit_from] * units[unit_to]).round(2)
# end





# 返還前の単位の長さ÷返還前の単位の比率 * 変換ごの単位の比率
# 1メートルをインチに直すのであれば、1÷1.0*39.37=39.37





# メソッドを改善して見ましょう。
# メソッドの引数には'm'や'ft'のような文字列をわたいsていますが、必ずしも
# 文字列出なくても良い気がする。
# また長さの単位はハッシュのキーにもなってます。こういう時に最適なのが。。。シンボルです！
# 長さの単位は文字列ではなくシンボルを渡すようにしてみましょう。



