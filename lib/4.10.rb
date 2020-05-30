numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
    puts n 
    break if n == 5
end
break を使うと、繰り返し処理を脱出することができます。


numbers = [1,2,3,4,5].shuffle
i = 0
while i < numbers.size
    n = numbers[i]
    puts n
    break if n == 5
    i += 1
end



ret = 
while true
    break
end
ret

ret = 
while true
    break 123
end
ret

ret = 
while true
    break 123
end
ret