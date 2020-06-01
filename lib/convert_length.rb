# def convert_length(length,from: :m,to: :m)
#     units = {m:1.0,ft: 3.28,in:39.37,}
#     (length/units[from]*units[to]).round(2)
# end





# メソッドのなかで作成しているハッシュについて見直してみましょう。
# このハッシュは時にキーや値が追加されたり変更されたりしないので、メソッドを実行するたびに作り直す必要はありません。
# こいういオブジェクトは、メソッドのそとで定数として、保持しておく方が実行効率がよくなります。
# というわけ次のようにハッシュをメソッドの外に移動させ、定数化します。




# 5.5.3 convert_lengthメソッドを改善する

UNITS = {m: 1.0,ft: 3.28, in: 39.37}
def convert_length(length,from: :m, to: :m)
    (length/UNITS[from]*UNITS[to]).round(2)
end





