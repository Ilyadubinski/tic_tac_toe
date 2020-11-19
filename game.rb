require_relative "board.rb"
require_relative "human_player.rb"


class Game 

    def initialize(mark_1, mark_2)
        @board = Board.new
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @current_player = @player_1
    end


    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else
            @current_player = @player_1
        end
        @current_player
    end

    def play 
        while @board.empty_positions? 
            @board.print_grid 
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                print "Congrats!! Player #{@current_player.mark} won!"
                @board.print_grid 
                return 
            else
                switch_turn
            end
        end

        print 'DRAW DRAW DRAW DRAW DRAW'
    end


end