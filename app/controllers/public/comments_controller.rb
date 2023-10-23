class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review = @review
    @comment.save!
    flash[:notice] = "コメントをしました。"
    redirect_to show_review_path(@comment.review.id)
  end
  
  def destroy
    @review = Rreview.find(params[:id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to show_review_path(@review.id)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment_writing)
  end
end
