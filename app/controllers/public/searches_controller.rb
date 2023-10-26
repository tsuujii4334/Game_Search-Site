class Public::SearchesController < ApplicationController
  
  def index
    @range = params[:range]
    @word = params[:word]

    if @range == "Game"
      @games = Game.looks(params[:search], params[:word])
    else
      @genre_ids = Genre.looks(params[:search], params[:word]).pluck(:id)#.pluck(:id)=>取得したジャンルのIDカラムを取得
      @games = Game.where(genre_id:@genre_ids)
    end
  end
end
