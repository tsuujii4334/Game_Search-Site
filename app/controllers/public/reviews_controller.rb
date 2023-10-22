class Public::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:review_id])
    @comments = @review.comment.all
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.game = Game.find(params[:game_id])
    @review.save!#セーブされない
    flash[:notice] = "レビューを投稿しました。"
    redirect_to show_game_path(@review.game.id)
  end

  def destroy
    review = Rreview.find(params[:id])
    review.destroy
    redirect_to games_path
  end

  private
  def review_params
    params.require(:review).permit(:review_writing)
  end
end
