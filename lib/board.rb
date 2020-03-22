require 'pry'

class Board
  
  attr_accessor :cells
  
  def reset!
    @cells = Array.new(9, " ")
  end

  def initialize
    reset!
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def convert(move)
    move.to_i - 1
  end

  def position(move)
    @cells[convert(move)]
  end

  def update (move, player)
    @cells[convert(move)] = player.token
  end

  def full?
     @cells.all?(/[XO]/)
  end
 
  def taken?(move)
    if (@cells[convert(move)] == "X" || @cells[convert(move)] == "O")
      true
    else
      false
    end
  end
 
  def valid_move?(move)
    move.to_i.between?(1,9) && !taken?(move) && !full?
  end
  
  def turn_count
    count = 0
    @cells.each do |cell|
      if cell =~ /[XO]/
        count += 1
      end
    end
    count
  end
  
end