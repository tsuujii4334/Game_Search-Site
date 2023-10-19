class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:id])
    @comment = Comment.new(comment_params)
    @comment.save!
    flash[:notice] = "コメントをしました。"
    redirect_to show_review_path(@review.id)
  end
  
  def destroy
    @review = Rreview.find(params[:id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to show_review_path(@review.id)
  end
  
  private
  def game_params
    params.require(:comment).permit(:comment_writing)
  end
end
