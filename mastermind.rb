class Game

  def initialize(player_name, comp_sequence)
    @game_player=player_name
    @sequence=comp_sequence
    @guess_result=[]
  end

  def sequence
    print @sequence
  end

  def instructions
    30.times{puts ""}
    puts "Hello #{@game_player} and welcome to Mastermind!\n\n"
    puts "The computer will generate a four colour code and your job is to crack the code.\n\n"
    puts "The colours available are Red, Orange, Yellow, Green, Blue, Indigo and Violet\n\n"
    puts "After each round your guess will be evaluated. If you guess the correct colour in the right place you are hot\n"
    puts "If you guess a correct colour in the wrong position you are warm\n"
    puts "If you guess an incorrect colour you are cold."
    puts "#{@game_player}, you have 12 attempts to crack the code.\n\n"
  end

  def guess
    puts "Please enter your guess.\n\n"
    player_guess=gets.chomp
    @player_guess_array= player_guess.split
  end

  def player_guess_array
    @player_guess_array
  end

  def check_guess
    i=0
      while i<4
        if @player_guess_array[i]==@sequence[i]
          @guess_result<<"#{@player_guess_array[i]} = HOT"
        elsif  @player_guess_array[i]!=@sequence[i] && @sequence.include?(@player_guess_array[i])
            @guess_result<<"#{@player_guess_array[i]} = warm"
        else
            @guess_result<<"#{@player_guess_array[i]} = cold"
        end
      i+=1
    end
    print @guess_result
    @guess_result=[]
  end

  def win?
    if @player_guess_array==@sequence
      true
    else
      false
    end
  end
end

class Player
  def initialize
    name_player
  end

  def name_player
    puts "What is the name of the player?\n\n"
    name=gets.chomp
    name.capitalize!
    @name=name
  end

  def name
    @name
  end
end

class Computer
  #@colours=["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
  def initialize
    @colours=["red", "orange", "yellow", "green", "blue", "indigo", "violet"]
    pick_sequence
  end

  def pick_sequence
    @first= @colours[rand(0..6)]
    @second= @colours[rand(0..6)]
    @third= @colours[rand(0..6)]
    @fourth= @colours[rand(0..6)]
    @sequence=[@first, @second, @third, @fourth]
  end
end

#Game set up
the_player=Player.new
the_computer=Computer.new
the_game=Game.new(the_player.name, the_computer.sequence)

#the_game.sequence
the_game.instructions

#game play
round =1
while round <13
  puts "\n\nRound #{round}\n\n"
  the_game.guess
  the_game.check_guess
  break if the_game.win? ==true
  round+=1
end

if the_game.win? ==true
  puts "\n\nCongratualtions #{the_player.name}, you cracked the code!"
else
  puts "\n\n#{the_player.name}, you have no more guesses\n\n"
  puts "The correct answer was\n\n"
  the_game.sequence
end
