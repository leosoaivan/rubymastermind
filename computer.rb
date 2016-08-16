class Computer
  attr_accessor :secret_code, :name, :possible

  def initialize
    @charset = ("A".."F").to_a
    @secret_code = []
    @name = "Computer"
    @possible = @charset.repeated_permutation(4).to_a
  end

  def get_guess
    sleep(1)
    @possible.sample
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
