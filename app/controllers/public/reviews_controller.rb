class Public::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = @review.comment.all
  end
  
  def create
    
  end
  
  def destroy
  end
end
