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
