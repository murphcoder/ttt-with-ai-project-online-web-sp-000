require 'pry'

class Game
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]
  
  attr_accessor :board, :player_1, :player_2
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_move|
      if win_move.all? {|space| @board.cells[space] == "X"} || win_move.all? {|space| @board.cells[space] == "O"}
        return win_move
      end
    end
    return false
  end
  
  def draw?
    won? == false && @board.full?
  end
  
  def over?
    @board.full? || won? != false
  end
  
  def winner
    if won? != false
      if won?.all? {|cell| @board.cells[cell] == "X"}
        "X"
      else
        "O"
      end
    else
      nil
    end
  end
  
  def turn
    move = current_player.move(@board)
    @board.update(move,current_player)
  end
  
  def play
    until over? || draw? || won?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def self.start
    puts "Welcome to Tic Tac Toe!"
    puts "How many players would you like? 0, 1, or 2?"
    players = gets.strip
    if players == "0"
      self.new(Players::Computer.new("X"),Players::Computer.new("O")).play
      elsif players == "1"
      puts "Would you like to play X or O?"
      x_or_o = gets.strip
      if x_or_o == "X" || "x"
        self.new(Players::Human.new("X"),Players::Computer.new("O")).play
      else
        self.new(Players::Human.new("O"),Players::Computer.new("X")).play
      end
    else
      puts "Would Player 1 like to be X or O?"
      p1 = gets.strip
      if p1 == "X" || "x"
        self.new(Players::Human.new("X"),Players::Human.new("O")).play
      else
        self.new(Players::Human.new("O"),Players::Human.new("X")).play
      end
    end
  end
  
end