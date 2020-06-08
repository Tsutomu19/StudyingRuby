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
    
    
    # 6.4.2　ハッシュ記法変換プログラムを実装する
    
    # 正規表現を作っていくときはRubularのようなオンラインツールを使って、トライアンドエラーを繰り返しながら正規表現を作るのが便利です
    
    
    
    # :[a-z0-9_]+
    # []はいずれか一文字を表すメタ文字です。a-zや0-9はそれぞれ『小文字のアルファベットのa-zまでと数字の0-9までを表しています。
    # プラスアンダースコアのいずれか一文字の意味になります。
    # 最後についている　+は直前の文字が一回以上連続するということを意味するメタ文字
    
    
    # \wは[A-Za^z0-9_]と同じ意味になる





    
    # 確認用
    # actual = convert_hash_syntax(old_syntax)
    # puts actual
    # assert_equal expected, actual