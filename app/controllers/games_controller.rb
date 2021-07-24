class GamesController < ApplicationController
  def new
    vowels = %w[A E I O U Y]
    general = ('A'..'Z').to_a
    @letters = []
    3.times { @letters << vowels.sample }
    7.times { @letters << general.sample }
    @letters.shuffle!
  end

  def score
     # it isn't right
    @attempt = params[:attempt].split("")
    @attempt.each do |letter|
      @letters.include? letter
    end
  end
end
