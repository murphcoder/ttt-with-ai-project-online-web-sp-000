require 'pry'

module Players
  
  class Computer < Player
    
    @board = nil
    
    ALMOST_WINS = {
      [0,1] => "3",
      [0,2] => "2",
      [1,2] => "1",
      [3,4] => "6",
      [3,5] => "5",
      [4,5] => "4",
      [6,7] => "9",
      [6,8] => "8",
      [7,8] => "7",
      [0,3] => "7",
      [0,6] => "4",
      [3,6] => "1",
      [1,4] => "8",
      [4,7] => "2",
      [1,7] => "5",
      [2,5] => "9",
      [2,8] => "6",
      [5,8] => "3",
      [0,4] => "9",
      [0,8] => "5",
      [4,8] => "1",
      [2,4] => "7",
      [2,6] => "5",
      [4,6] => "3"
    }
    
    def move(board)
      @board = board
      if win
        win
        elsif counter_attack
        counter_attack
        elsif first_move
        first_move
        elsif center
        center
        elsif corner
        corner
      else
        edge
      end
    end
    
    def opponent_token
      if self.token == "X"
        "O"
      else
        "X"
      end
    end

    def block_or_win(token)
      ALMOST_WINS.each do |input, move|
        if @board.cells[input[0]] == token && @board.cells[input[1]] == token && @board.valid_move?(move)
          return move
        end
      end
      return false
    end

    def win
      block_or_win(self.token)
    end
    
    ##If about to lose, counter-attack.
    
    def counter_attack
      block_or_win(opponent_token)
    end
    
    def first_move
      if @board.cells.all?(" ")
        "1"
      else
        false
      end
    end
    
    def center
      if @board.valid_move?("5")
        "5"
      else
        false
      end
    end
    
    def corner
      if @board.valid_move?("1")
        "1"
        elsif @board.valid_move?("3")
        "3"
        elsif @board.valid_move?("7")
        "7"
        elsif @board.valid_move?("9")
        "9"
      else
        false
      end
    end
    
    def edge
      if @board.valid_move?("2")
        "2"
        elsif @board.valid_move?("4")
        "4"
        elsif @board.valid_move?("6")
        "6"
        elsif @board.valid_move?("8")
        "8"
      else
        false
      end
    end
    
  end
  
end