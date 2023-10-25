class Admin::CommentsController < ApplicationController
 def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to admin_show_review_path(@comment.review.id)
 end
end
