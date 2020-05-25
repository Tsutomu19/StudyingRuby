require 'minitest/autorun'
require './lib/rgb'
class RgbTest < Minitest::Test
    def test_to_hex
        assert_equal '#000000', to_hex(0,0,0)
        assert_equal '#ffffff', to_hex(255,255,255)
    end
end



'0'.rjust(5)
'0'.rjust(5,'0')
'0'.rjust(5,'_')



0.to_s(16).rjust(2,'0')
255.to_s(16).rjust(2,'0')

def to_hex(r,g,b)
    '#'+
    r.to_s(16).rjust(2,'0')+
    g.to_s(16).rjust(2,'0')+
    b.to_s(16).rjust(2,'0')
end

def to_hex(r,g,bf)
    hex = '#'
    [r,g,b].each do |n|
        hex += n.to_s(16).rjust(2,'0')
    end
    hex
end

def to_hex(r,g,b)
    [r,g,b].inject('#') do |hex, n|
        hex+ n.to_s(16).rjust(2,'0')
    end
end


4.6.3