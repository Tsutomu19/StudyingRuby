    class Ticket
        attr_reader :fare, :stamped_at

        def initialize(fare)
            @fare = fare
        end

        def stamp(name)
            @stamped_at = name
        end
    end





    # また運賃から(fare)と乗車駅(stamped_at)が外部から取得できるようにゲッターメソッドを追加しておきマウs。





