シンボルがキーであるものについては=>を使わない新しい記法に修正して返す。とういうのが要件です


old_syntax = TEXT
{
    :name =>'Alice',
    :age => 20,
    :gender => :female
}
TEXT
convert_hash_syntax(old_syntax)