# frozen_string_literal: true

# This class mannages every function related to a tic-tac-toe matrix
class Matrix
  attr_accessor :matrix

  def initialize
    @matrix = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
  end

  def assign_value(position, value)
    @matrix[position[0].to_i][position[1].to_i] = value
  end

  def check_three_in_line
    flag1 = check_array(@matrix)
    column_array = @matrix.transpose
    flag2 = check_array(column_array)
    dig_array = [[@matrix[0][0], @matrix[1][1], @matrix[2][2]],
                 [@matrix[0][2], @matrix[1][1], @matrix[2][0]]]
    flag3 = check_array(dig_array)
    [flag1, flag2, flag3]
  end

  def check_array(array)
    array.each do |arr|
      next unless arr.uniq.size <= 1

      puts arr.all?('O') ? 'User 1 wins' : 'User 2 wins'
      return true
    end
  end
end

def user_choice
  flag = true
  while flag
    puts 'Choose X or O'
    choice1 = gets.chomp.upcase
    next unless %w[X O].include?(choice1)

    flag = false
    choice2 = choice1 == 'X' ? 'O' : 'X'
  end
  [choice1, choice2]
end

def user_input(matrix)
  array_2d_print(matrix)
  puts 'Enter x: '
  position_x = gets
  puts 'Enter y: '
  position_y = gets
  [position_x, position_y]
end

def game(winner, choice)
  matrix = Matrix.new
  while winner == false
    user1 = user_input(matrix.matrix)
    winner = modify_matrix(user1, matrix, choice[0])
    break if winner == true

    user2 = user_input(matrix.matrix)
    winner = modify_matrix(user2, matrix, choice[1])
    array_2d_print(matrix.matrix)
  end
end

def modify_matrix(position, matrix, value)
  matrix.assign_value(position, value)
  flags = matrix.check_three_in_line
  flags.any?(true) ? true : false
end

def array_2d_print(array)
  array.each do |arr|
    arr.each do |item|
      print "#{item} "
    end
    print "\n"
  end
end

game(false, user_choice)
