class Public::BookmarksController < ApplicationController
  def index
    @bookmarks = current_user.bookmarks.all.page(params[:page]).per(8)
    @bookmarkcount = @bookmarks.all.count
    @game = Game.where(price: 1..1000 )#値段で絞り込む機能を実装途中
  end
end
