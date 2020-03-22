module Players
  
  class Human < Player
  
    def move(board)
      board.display
      puts "Make Your Move"
      mark = gets.strip
      if board.valid_move?(mark)
        mark
      else
        puts "That is not a valid move"
        move(board)
      end
    end
    
  end
  
end