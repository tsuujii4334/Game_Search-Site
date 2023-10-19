class Admin::ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
    @comments = @review.comment.all
  end
  
  def destroy
    
  end
end
