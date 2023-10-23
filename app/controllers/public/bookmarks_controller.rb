class Public::BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.all.page(params[:page]).per(8)
    @bookmarkcount = @bookmarks.all.count
    @game = Game.where(price: 1..1000 )#値段で絞り込む機能を実装途中
  end
  
  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.game = Game.find(params[:game_id])
    @game = Game.find(params[:game_id])
    @bookmark.save!
    flash[:notice] = "ブックマークしました。"
    redirect_to show_game_path(@bookmark.game.id)
  end
  
  def delete
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
    redirect_to index_bookmark_path(current_user)
  end
end