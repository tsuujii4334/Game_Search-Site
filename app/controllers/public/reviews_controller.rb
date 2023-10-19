class Public::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = @review.comment.all
  end
  
  def create
    @game = Game.find(params[:id])
    @review = Review.new(review_params)
    @review.save!
    flash[:notice] = "レビューを投稿しました。"
    redirect_to show_game_path(@game.id)
  end
  
  def destroy
    review = Rreview.find(params[:id])
    review.destroy
    redirect_to games_path
  end
  
  private
  def game_params
    params.require(:review).permit(:review_writing)
  end
end
