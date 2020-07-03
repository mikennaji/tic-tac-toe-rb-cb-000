def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
  number= user_input.to_i
  index = number-1


 end

  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
       return false
    elsif board[index] == "X" || board[index] =="O"
       return true
    end
  end

  def  valid_move?(board,index)
    if position_taken?(board,index) == false && index.between?(0,8)
      return true
    elsif position_taken?(board,index) == true && index.between?(0,8)
      return false
    end
  end

  def turn_count(array)
    counter = 0
    array.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    return  counter
  end

  def current_player(array)
    count = turn_count(array)
    if count%2 ==0 || count == 0
      return "X"
    else
      return "O"
    end
  end

  def update_array_at_with(array, index, value)
    array[index] = value
  end

  def move(array,index,value="X")
      update_array_at_with(array,index,value)
      display_board(array)
  end

  def turn(board)
   puts("Please enter 1-9:")
   raw_input= gets.chomp
   index1 = input_to_index(raw_input)
    if  valid_move?(board,index1) == true
      move(board,index1)
      display_board(board)
    else
     puts("Please enter 1-9:")
     raw_input= gets.chomp
     index1 = input_to_index(raw_input)
    end

 end

 def play(board)


     board.length.times do
       break if won?(board)== true  || over?(board)==true
       turn(board)



   end


  if winner(board)=="X"
    puts "Congratulations X!"
  else
   puts "Congratulations O!"
  end
  if draw?(board)
   puts "Cat's Game!"
  end


 end

 WIN_COMBINATIONS = [ [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def full?(board)
  board.all? { |x| x=="O" || x == "X"  }


end

def draw?(board)
  full?(board)
  set = won?(board)
    if set.nil?
      return true
    end
  if set== WIN_COMBINATIONS[0]
    return false
  end



end

def won?(board)


  WIN_COMBINATIONS.each do |win_combination|

    win_index_1=win_combination[0]
    win_index_2=win_combination[1]
    win_index_3=win_combination[2]

    position_1= board[win_index_1]
    position_2=board[win_index_2]
    position_3= board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    end
    if position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end


  end

  if board.empty?
    return false
  end




end

def over?(board)
  set = won?(board)
  if set.nil? && full?(board)
    return true
  end
  draw?(board)
  won?(board)
end

def winner(board)

  set = won?(board)
  if set.nil?
    return nil
  end
  win_set =board[set[0]]
  if win_set == "O"
    return "O"
  end
  if win_set == "X"
    return "X"
  else
    return nil
  end



end
