class Public::CommentsController < ApplicationController
  def create
    @review = Review.find(params[:review_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.review = @review
    if @comment.save
      redirect_to show_review_path(@comment.review.id)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to show_review_path(@comment.review.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment_writing)
  end
end
