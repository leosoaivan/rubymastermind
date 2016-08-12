#!/usr/bin/env ruby

class Game
  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
    @guesses = []
    @feedback = []
    @game_won = FALSE
    @@turns = 12
    game_start
  end

  private

  def game_start
    code_generator
    start_message
  # puts "#{@secret_code}"
    game_loop
  end

  def code_generator
    4.times do
    @secret_code << @charset[rand(6)]
    end
  end

  def start_message
    puts "Welcome to Master Mind!"
    puts "Guess the computer's 4-character code, using the letters A thru F."
    puts "Duplicate letters ARE allowed!"
    puts ""
  end

  def game_loop
    begin
      turn_countdown
      player_guess = get_code_input
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

  def get_code_input
    begin
      puts "Enter your 4-letter code, A thru F:"
      guess = gets.gsub!(/\s+/, "").upcase
    end until guess.length == 4 && /[A-F]+{4}/.match(guess)
    guess.split(//)
  end

  def store_code_input(p_guess)
    @guesses << p_guess
  end

  def print_code_output(guesses, feedback)
    puts ""
    (0..@guesses.length - 1).each do |i|
      print "#{guesses[i][0]}-#{guesses[i][1]}-#{guesses[i][2]}-#{guesses[i][3]} "
      print "=> #{feedback[i][0]} exact, "
      puts "#{feedback[i][1]} close"
    end
  end

  def prepare_feedback(p_guess)
    @feedback << [exact_matches(p_guess), close_matches(p_guess)]
    @game_won = TRUE if p_guess == @secret_code
  end

  def exact_matches(p_guess)
    exact = 0
    (0..p_guess.length - 1).each do |i|
      next unless p_guess[i] == @secret_code[i]
      exact += 1
    end
    exact
  end

  def close_matches(p_guess)
    player_ary = []
    code_ary = []
    (0..p_guess.size - 1).each do |i|
      next unless p_guess[i] != @secret_code[i]
      player_ary << p_guess[i]
      code_ary << @secret_code[i]
    end
    (player_ary & code_ary).length
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
