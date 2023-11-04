class Public::BookmarksController < ApplicationController
  def index

    @bookmarks = current_user.bookmarks.filter_price(game_filter_params)
    games_id = @bookmarks.where(user_id: current_user.id).pluck(:game_id)
    @bookmark_games = Kaminari.paginate_array(Game.find(games_id)).page(params[:page]).per(8)
    @bookmarkcount = @bookmarks.count
    
    # 以下の3行は上記４行をmapで表しています。
    # @bookmarks = current_user.bookmarks.all.filter_price(game_filter_params).to_a
    # @bookmark_games = Kaminari.paginate_array(@bookmarks.map(&:game)).page(params[:page]).per(8)
    # @bookmarkcount = @bookmarks.count
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.game = Game.find(params[:game_id])
    @game = Game.find(params[:game_id])
    already_bookmark = current_user.bookmarks.find_by(game_id: @bookmark.game_id)
    if already_bookmark
      flash[:notice] = "すでにブックマークしています。"
      redirect_to show_game_path(@bookmark.game.id)
    else
      @bookmark.save!
      flash[:notice] = "ブックマークしました。"
      redirect_to show_game_path(@bookmark.game.id)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @bookmark.destroy
    redirect_to index_bookmark_path(current_user)
  end

  private
  def game_filter_params
    params.permit(:price)
  end
end