class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = @review.comment.all
  end
  
  def destroy
    review = Rreview.find(params[:id])
    review.destroy
    redirect_to games_path
  end
end
