def convert_hash_syntax(old_syntax)

    old_syntax.gsub(/:(\w+)*=>*/,'\1:')
 
end

# gsubメソッドの第二引数で書かれている\1は1番目にキャプチャされた文字列を表しています。すなわち"name"や"age"は入る。

