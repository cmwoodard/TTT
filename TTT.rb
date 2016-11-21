#Classes
class Board
  attr_accessor :the_board
  def initialize()
    @the_board=[1,2,3,4,5,6,7,8,9]
  end
  
  def show_board
	#Clears screen - draws board
	system("cls")
	puts "TIC TAC TOOOOOOOE"
	2.times{puts ""}
	
	(1...10).each{|x|	  
	  if x%3==0 && x<9
		puts "#{@the_board[x-1]}\n---------"
	  elsif x<9
	    print "#{@the_board[x-1]} | "
	  else
	    print @the_board[x-1]
	  end
	}
	
	2.times{puts ""}
  end
  
  def reset_board
	@the_board=[1,2,3,4,5,6,7,8,9]
  end
  
end

class Player
  attr_accessor :name, :state
  def initialize(name)
    @name = name
	@state = []
  end
end

#Game

#this will stay false until user decides to end the game
quit_game = false

win_array = [[1,2,3]]

board = Board.new
board.show_board

print "Player 1, what is your name? "
player1= Player.new(gets.chomp)
puts "Hi, #{player1.name}.\n"
print "Player 2, what is your name? "
player2= Player.new(gets.chomp)
puts "Hi, #{player2.name}.\n"
current_player = player1
win_array = [[1, 2, 3], [4, 5, 6],[7, 8, 9], [1, 4, 7],
			 [2, 5, 8], [3, 6, 9], [1, 5, 9] , [7, 5, 3]]
while quit_game == false
	
	board.show_board
	
	print "#{current_player.name}, where would you like to play?"
	answer = gets.chomp.to_i
	current_player.state.push(answer)
	
	if current_player == player1
	  board.the_board[answer-1] = "x"
	else
	  board.the_board[answer-1] = "o"
	end
	
	for x in (0...win_array.length)
		#puts (current_player.state & win_array[x]).length
		
		if (current_player.state & win_array[x]).length==3
			board.show_board
			puts "#{current_player.name} wins!"
			quit_game = true
			
		elsif player1.state.length==5
			board.show_board
			puts "It's a TIE."
			quit_game = true
		end		
	end
	
	current_player == player1 ? current_player = player2 : current_player = player1
	
end


