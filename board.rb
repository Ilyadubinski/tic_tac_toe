# require byebug 

class Board 

    def initialize 
        @grid = Array.new(3) { Array.new(3,'_')}
        # no args 
        # initialize 3 by 3 grid
        # every position should contain an underscore '_'
    end

    def valid?(position)
        # This method should return a boolean indicating whether or not the 
        # specified position is valid for the board, meaning the position is 
        # not "out of bounds."
        row = position[0]
        column = position[1]

        return false if row > 2 || row < 0 
        return false if column > 2 || column < 0 

        true 
    end

    def empty?(position)
        # This method should return a boolean indicating whether or not 
        # the specified position does not contain a player's mark.
        row = position[0]
        column = position[1]
        
        return false if @grid[row][column] != '_'

        true 
    end

    def place_mark(position, mark)
        # This method should assign the given mark to the specified position of 
        # the grid. It should raise an error when the position is not #valid? or not #empty?.

        if !valid?(position) || !empty?(position)
            raise error 
        else
            row = position[0]
            column = position[1]
            @grid[row][column] = mark 
        end

    end

    

    def print_grid 
        @grid.each do |row| 
        puts row.join(" ")
        end
    end

    def win_row?(mark)

        @grid.each do |row|
            if row.all? { |markk| mark == markk }
                # debugger 
                return true 
            else
                return false 
            end 
        end
    end 

    def win_col?(mark)
        temp = @grid.transpose 
        temp.each do |col|
            if col.all? { |markk| mark == markk }
                return true 
            else
                return false 
            end 
        end
    end

    def win_diagonal?(mark)

    diagonal_1 = (0..@grid.length-1).collect { |i| @grid[i][i] }
        return true if diagonal_1.all? { |markk| mark == markk } 

    diagonal_2 = (0..@grid.length-1).collect { |i| @grid.reverse[i][i] }
        return true if diagonal_2.all? { |markk| mark == markk } 

    false
    end

    def win?(mark)
        if win_diagonal?(mark)
            print "you won by diagonal!"
            return true
        elsif win_col?(mark)
            print "you won by column!"
            return true
        elsif  win_row?(mark)
            print "you won by row!"
            return true
        else
            return false 
        end
    end

    def empty_positions?
        @grid.flatten.any? { |pos| pos == '_' }
    end


end