#!/usr/bin/env ruby

class Player
  attr_accessor :secret_code

  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
  end

  def get_guess
    begin
      puts "Enter your 4-letter code, A thru F:"
      guess = gets.gsub!(/\s+/, "").upcase
    end until guess.length == 4 && /[A-F]+{4}/.match(guess)
    guess.split(//)
  end

  def create_code
    code_generator
  end

  private

  def code_generator
    4.times do
    @secret_code << @charset[rand(6)]
    end
  end

end

class Computer
  attr_accessor :secret_code

  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
  end

  def get_guess
    begin
      puts "Please enter a 4-character code for the computer to guess,"
      puts "using the letters A through F:"
      code = gets.gsub!(/\s+/, "").upcase
    end until guess.length == 4 && /[A-F]+{4}/.match(guess)
    code.split(//)
  end

  def create_code
    code_generator
  end

  private

  def code_generator
    4.times do
    @secret_code << @charset[rand(6)]
    end
  end

end

class Game
  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
    @guesses = []
    @feedback = []
    @game_won = FALSE
    @@turns = 12
    @current_player = NIL
    game_start
  end

  private

  def start_message
    puts "*********************************************************************"
    puts "                          MASTER MIND                                "
    puts ""
    puts "                    Welcome to Master Mind"
    puts "   Try to guess the computer's secret 4-character code using the"
    puts " letters A through F. Duplicate letters ARE allowed. Otherwise, make"
    puts "       your own code and see if the computer can guess it."
    puts ""
    puts "                    (It most likely will!)"
    puts "*********************************************************************"
  end

  def player_role
    begin
      puts ""
      puts "Would you like to (S)ET the secret code, or would you like to"
      puts "(G)UESS the computer's code? S/G?"
      role = gets.chomp.upcase
      puts "You picked (#{role}). Is this correct? Y/N?"
      confirm = gets.chomp.upcase
    end until confirm == "Y"
    role
  end

  def current_player(p)
    if p == "G"
      @current_player = Player.new
    else
      @current_player = Computer.new
    end
  end

  def game_start
    system "clear"
    start_message
    current_player(player_role)
    @current_player.create_code
    puts "#{@current_player.secret_code}"
    game_loop
  end

  def game_loop
    begin
      turn_countdown
      player_guess = @current_player.get_guess
      store_code_input(player_guess)
      prepare_feedback(player_guess)
      print_code_output(@guesses, @feedback)
    end until @@turns == 0 || player_guess == @secret_code
    end_message
  end

  def turn_countdown
    puts "You have #{@@turns} turns left."
    @@turns -= 1
  end

  def store_code_input(p_guess)
    @guesses << p_guess
  end

  def prepare_feedback(p_guess)
    @feedback << [exact_matches(p_guess), close_matches(p_guess)]
    @game_won = TRUE if p_guess == @current_player.secret_code
  end

  def exact_matches(p_guess)
    exact = 0
    (0..p_guess.length - 1).each do |i|
      next unless p_guess[i] == @current_player.secret_code[i]
      exact += 1
    end
    exact
  end

  def close_matches(p_guess)
    ary1 = []
    ary2 = []
    (0..p_guess.size - 1).each do |i|
      next unless p_guess[i] != @current_player.secret_code[i]
      ary1 << p_guess[i]
      ary2 << @current_player.secret_code[i]
    end
    ary3 = (ary1 & ary2).flat_map { |n| [n]*[ary1.count(n), ary2.count(n)].min }
    ary3.length
  end

  def print_code_output(guesses, feedback)
    puts ""
    (0..@guesses.length - 1).each do |i|
      print "#{guesses[i][0]}-#{guesses[i][1]}-#{guesses[i][2]}-#{guesses[i][3]} "
      print "=> #{feedback[i][0]} exact, "
      puts "#{feedback[i][1]} close"
    end
  end

  def end_message
    if @game_won == TRUE
      puts "You figured out the secret code!"
    else
      puts "You've lost to the Master Mind!"
    end
    restart
  end

  def restart
    puts "Would you like to play again? Y/N?"
    input = gets.chomp.downcase
    if input == "y"
      x = Game.new
    elsif input == "n"
      puts "Goodbye!"
    else
      puts "I didn't get that."
      restart
    end
  end

end

x = Game.new
