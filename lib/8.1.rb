8.1 イントロダクション　


Rubyにはクラスのようでクラスでない、モジュールと呼ばれる仕組みがあります

大規模なプログラムでは多かれ少なかれモジュールを使用することになるはずです。


モジュールを使ってる意識はなくとも裏側ではいくつかのモジュールが大活躍しています。
Rubyのモジューるとは一体何者なのか理解していきましょう。



8.1.1 deep_freezeメソッド

実務でもちょっと役に立つかもしれない小さな便利プログラムを作成します。





class Team
    # 配列をfreezeして要素の追加や削除を禁止する
    COUNTRIES = ['Japan','US','India'].freeze
end

しかし、配列やハッシュの場合、配列の内部の要素もfreezeしないと要素の値が変更される恐れがあります。

    class Team
        # 配列をfreezeして要素の追加や削除を禁止する
        COUNTRIES = ['Japan'.freeze,'US'.freeze,'India'.freeze].freeze
    end
    
    
    
    とはいえ、配列やハッシュのすべての要素を毎回freezeするのは面倒dです。
    そこでdeep_freezeというメソッドを作成し、配列やハッシュ自身と内部の全要素をfreezeできるようにしましょう。
    deep_freezeメソッドの実行イメージは以下の通りです。
    
    
    class Team
        # 配列をfreezeして要素の追加や削除を禁止する
        COUNTRIES = deep_freeze(['Japan','US','India'])
    end


    Team::COUNTRIES.frozen?
    Team::COUNTRIES.all?{|country|coutry.frozen?}
# 配列自身と配列の要素がfreezeされている
    class Bank
        CURRENCIES = depp_freeze({'Japan'=>'yen','US'=>'dollar','India'=>'rupee'})
    end

# ハッシュ自身とハッシュの全要素がfreezeされている
    Bank:CURRENCIES.all? {|key,balue| key.frozen? && value.frozen? }


    上のコードではTeamクラスをBankクラスという全く別のクラスでdeep_freezeメソッド呼び出しています。このように　deep_freezeメソッドは特定のクラスだけでなく様々なクラスで呼べるようにします。
    また、プログラムを複雑にしないように次のような制限を入れることにします。


    deep_frrezeメソッドの引数は配列またはハッシュのみとする
    引数の配列やハッシュはふらっとな構造にする

    特定のクラスだけでなく様々なクラスでよべるメソッドはどうやって実現できるのか、この賞を読み込みながらイメージを作り上げて行ってください。


    8.1.2　この章で学ぶこと

    モジュールの概要
    モジュールのミックスイン
    関数や定数を提供するモジュールの作成
    状態を保持するモジュールの作成
    モジュールの関する高度な話題


    