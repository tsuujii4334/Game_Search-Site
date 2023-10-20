class Admin::GamesController < ApplicationController
  def index
    @gamecount = Game.all.count
    @games = Game.all.page(params[:page]).per(8)
    @game = Game.where(price: 1..1000 )#値段で絞り込む機能を実装途中
    # @game = Game("games.price DESC")
  end

  def new
    @game = Game.new
    @genres_name = Genre.all
  end

  def create
    @game = Game.new(game_params)
    if @game.save!
      flash[:notice] = "ジャンル作成に成功しました。"
      redirect_to admin_show_game_path(@game.id)
    else
      @genres_name = Genre.all
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    @reviews = @game.reviews
  end

  def edit
    @game = Game.find(params[:id])
    @genres_name = Genre.all
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      flash[:notice] = "ゲーム情報を編集しました。"
      redirect_to admin_show_game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to admin_games_path
  end

  private
  def game_params
    params.require(:game).permit(:profile_image,:name,:introduction,:price,:genre_id)
  end
end
