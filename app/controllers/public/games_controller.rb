class Public::GamesController < ApplicationController
  def index
    @gamecount = Game.all.count
    @games = Game.all.page(params[:page]).per(8)
  end

  def show
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews
    @review = Review.new(params[:review_id])
    @current_user = current_user
  end

  private
  def review_params
    params.require(:review).permit(:review_writing)
  end
end
