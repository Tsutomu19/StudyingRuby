
class Gate
    STATIONS = [:umeda, :juso, :mikuni]
    FARES = [150, 190]
    def initialize(name)
        @name = name
    end

    def enter(ticket)
        ticket.stamp(@name)
    end

    def exit(ticket)
        fare = calc_fare(ticket)
        fare <= ticket.fare
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

# # indexメソッドは配列のなかから引数に合致するようsの添字を取得するメソッドです。
# [:umeda,:juso, :mikuni].index(:juso)
# # => 1


