class Public::GamesController < ApplicationController
  def index
    @gamecount = Game.all.count
    @games = Game.all.page(params[:page]).per(8)
    @game = Game.where(price: 1..1000 )#値段で絞り込む機能を実装途中
    #@game = Game("games.price DESC")
  end

  def show
  end
end
