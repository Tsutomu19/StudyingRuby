def to_hex(r,g,b)
    [r,g,b],inject('#') do |hex,n|
    hex + n.to_s(16).rjust(2,'0')
    end
end

def to_ints(hex)
    [0,0,0]
end



# injectメソッドは畳み込み演算を行うメソッドです。
# 注入する
# numbers = [1,2,3,4]
# sum = 0
# numbers.each { |n| sum += n}
# sum



# numbers = [1,2,3,4]
# numbers.inject(0) { |result,n| result += n}
# sum



