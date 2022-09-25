# frozen_string_literal: true

$matrix = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]

def user1_input
  puts 'Enter x: '
  position_x = gets
  puts 'Enter y: '
  position_y = gets
  [position_x, position_y]
end

def user2_input
  puts 'Enter x: '
  position_x = gets
  puts 'Enter y: '
  position_y = gets
  [position_x, position_y]
end

def game
  user1 = user1_input
  modify_matrix(user1, 'O')
  user2 = user2_input
  modify_matrix(user2, 'X')
end

def modify_matrix(position, value)
  $matrix[position[0].to_i][position[1].to_i] = value
  # array_2d_print($matrix)
  check_row($matrix)
  check_column($matrix)
  check_diagonals($matrix)
end

def array_2d_print(array)
  array.each do |arr|
    arr.each do |item|
      print "#{item} "
    end
    print "\n"
  end
end

def check_row(array)
  array.each do |arr|
    next unless arr.uniq.size <= 1

    puts arr.all?('O') ? 'User 1 wins' : 'User 2 wins'
  end
end

def check_column(array)
  column_array = array.transpose
  # array_2d_print($matrix)
  column_array.each do |arr|
    next unless arr.uniq.size <= 1

    puts arr.all?('O') ? 'User 1 wins' : 'User 2 wins'
  end
end

def check_diagonals(array)
  dig_array = [[array[0][0], array[1][1], array[2][2]],
               [array[0][2], array[1][1], array[2][0]]]

  dig_array.each do |arr|
    next unless arr.uniq.size <= 1

    puts arr.all?('O') ? 'User 1 wins' : 'User 2 wins'
  end
end

3.times do
  game
end
