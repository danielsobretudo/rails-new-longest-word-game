# require "open-uri"

class GamesController < ApplicationController
  def new
    vowels = %w[A E I O U Y]
    general = ('A'..'Z').to_a
    @letters = []
    4.times { @letters << vowels.sample }
    8.times { @letters << general.sample }
    @letters.shuffle!
  end

  def score
    # it isn't right
    @letters = params[:letters]
    @attempt = params[:attempt]
    @array = []
    @attempt.split('').each do |letter|
      @array << @letters.include?(letter.upcase)
    end
    # @array.all?
    @isword = isword?(@attempt)
  end

  def isword?(word)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end
end
