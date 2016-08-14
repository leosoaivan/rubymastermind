class Computer
  attr_accessor :secret_code

  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
  end

  def get_guess
    computer_code = []
    4.times do
      computer_code << @charset[rand(6)]
    end
    computer_code
  end

  def create_code
    code_generator
  end

  private

  def code_generator
    begin
      puts "Enter your secret 4-letter code, A thru F:"
      guess = gets.gsub!(/\s+/, "").upcase
    end until guess.length == 4 && /[A-F]+{4}/.match(guess)
    @secret_code = guess.split(//)
  end

end
