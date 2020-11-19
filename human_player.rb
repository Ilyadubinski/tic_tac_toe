class HumanPlayer

    attr_reader :mark 

def initialize(mark_value)
    @mark = mark_value
end

def get_position
        print "Player #{@mark}, enter two numbers representing a position in the format `row col`--->" 
        input = gets.chomp 
        pos = input.split(' ').map(&:to_i)
        raise error if pos.length != 2 
        pos 
end
        
        



end