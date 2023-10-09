class Public::GamesController < ApplicationController
  def index
    @gamecount = Game.all.count
    @games = Game.all.page(params[:page]).per(8)
  end

  def show
  end
end
