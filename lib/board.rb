# frozen_string_literal: true

class Board
  attr_reader :board, :avail_squares
  attr_writer :board, :avail_squares

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @avail_squares = board.dup
  end

  def display_board
    line1 = " #{board[0]}  |  #{board[1]}  |  #{board[2]}  "
    line2 = '----|-----|-----'
    line3 = " #{board[3]}  |  #{board[4]}  |  #{board[5]}  "
    line4 = '----|-----|-----'
    line5 = " #{board[6]}  |  #{board[7]}  |  #{board[8]}  "
    [line1, line2, line3, line4, line5]
  end

  def rows
    row1 = [board[0], board[1], board[2]]
    row2 = [board[3], board[4], board[5]]
    row3 = [board[6], board[7], board[8]]
    [row1, row2, row3]
  end

  def columns
    col1 = [board[0], board[3], board[6]]
    col2 = [board[1], board[4], board[7]]
    col3 = [board[2], board[5], board[8]]
    [col1, col2, col3]
  end

  def diagonals
    diagonal1 = [board[0], board[4], board[8]]
    diagonal2 = [board[2], board[4], board[6]]
    [diagonal1, diagonal2]
  end

  def move(type, coordinate)
    raise 'Exception: Wrong coordinates' unless empty?(coordinate)

    board[coordinate - 1] = type
    avail_squares.delete(coordinate)
  end

  def empty?(coordinate)
    return true if avail_squares.any? coordinate

    false
  end
end
