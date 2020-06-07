# 6.4 rubyのハッシュ記法を変換する
# シンボルがキーであるものについては=>を使わない新しい記法に修正して返す。とういうのが要件です
require 'minitest/autorun'
require './lib/convert_hash_syntax'

class ConvertHashSyntaxTest < Minitest::Test
    def test_convert_hash_syntax

        old_syntax = <<~TEXT
        {
            :name =>'Alice',
            :age => 20,
            :gender => :female
        }
        TEXT
        expected = <<~TEXT
        {
            :name =>'Alice',
            :age => 20,
            :gender => :female
        }
        TEXT
        assert_equal expected,
        convert_hash_syntax(old_syntax)

        assert_equal'{}',convert_hash_syntax('{}')
    end
end


# <<~はヒアドキュメントからインデントを自動的に取り除いてくれる記法です。
# old_syntax = <<TEXT
# {
#     :name => 'Alice',
#     :age=>20,
#     :gender => :female
# }

# TEXT





