require 'pry'
class TicTacToe

    attr_accessor :board
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
        # @board = ["X", "X", "X", "X", "O", "O", "X", "O", "O"]
    end

    def display_board
        puts " #{self.board[0]} | #{self.board[1]} | #{self.board[2]} \n-----------\n #{self.board[3]} | #{self.board[4]} | #{self.board[5]} \n-----------\n #{self.board[6]} | #{self.board[7]} | #{self.board[8]} "
    end

    def input_to_index(string_number)
        
        index = string_number.to_i
       
        index -= 1
    end

    def move(board_index, token = "X")
        self.board[board_index] = token
    end

    def position_taken?(index)
        self.board[index] == " " ? false : true
    end

    def valid_move?(index)
        if self.board[index] == " " && (index >= 0 && index < 9)
            return true
        else 
            return false
        end
       
    end

    def turn_count
        count = 0
        self.board.each do |value|
            if value != " "
                count += 1
            end
        end
        count
    end

    def current_player
        count = turn_count
        if count % 2 == 0
            return "X"
        else
            return "O"
        end
    end
    
    def turn
        # ask for input
        puts "Please enter an Index Number 1-9:"
        # get input
        user_input = gets
        # # translate input into index
        index = input_to_index(user_input)
        # # if index is valid
        # valid_move?(converted_index)
        if valid_move?(index)
            # make the move for index
            token = current_player
            move(index, token)
            # show the board
        else
            # restart turn
            turn
        end
        display_board
    end
    
    def won?
        WIN_COMBINATIONS.each do |array|
            x_comb = array.all? {|index| @board[index] == "X"}
                if x_comb 
                    return array
                else 
                    o_comb = array.all? {|index| @board[index] == "O"}
                    if o_comb
                        return array
                    end
                end   
        end
        return false
    end

    def full? 
        if @board.all? {|value| value == "X" || value == "O"}
            return true
        end  
        return false
    end 

    def draw?
        if won?
            return false
        elsif !full?
            return false
        else
            return true
        end
    end

    def over?
        if draw? || full?
            return true
        end
    end

    def winner 
        if won?
            if current_player == "X"
                return "O"
            else 
                return "X"
            end
        else
            return nil
        end
    end

    def play
        until over? || won? do 
            turn 
        end
        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end
   
    end

end

tic = TicTacToe.new()

# tic.turn
