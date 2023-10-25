class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:review_id])
    @comments = @review.comments.all
  end
  
  def destroy
    @review = Rreview.find(params[:review_id])
    @review.destroy
    redirect_to admin_games_path
  end
end
