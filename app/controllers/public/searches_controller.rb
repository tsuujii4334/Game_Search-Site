class Public::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "Game"
      @games = Game.looks(params[:search], params[:word])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
  end
  
  def index
    @range = params[:range]
    @word = params[:word]

    if @range == "Game"
      @games = Game.looks(params[:search], params[:word])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
  end
end
