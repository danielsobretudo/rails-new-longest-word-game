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
# VOWELS = %w(A E I O U Y)

  # def new
  #   @letters = Array.new(5) { VOWELS.sample }
  #   @letters += Array.new(5) { (('A'..'Z').to_a - VOWELS).sample }
  #   @letters.shuffle!
  # end

  # def score
  #   @letters = params[:letters].split
  #   @word = (params[:word] || "").upcase
  #   @included = included?(@word, @letters)
  #   @english_word = english_word?(@word)
  # end

  # private

  # def included?(word, letters)
  #   word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  # end

  # def english_word?(word)
  #   response = URI.open("https://wagon-dictionary.herokuapp.com/#{word}")
  #   json = JSON.parse(response.read)
  #   json['found']
  # end
