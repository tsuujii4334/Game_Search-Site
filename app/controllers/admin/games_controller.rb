class Admin::GamesController < ApplicationController
  def index
    @gamecount = Game.all.count
    @games = Game.all.filter_price(game_filter_params).page(params[:page]).per(8)
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
    @game = Game.find(params[:game_id])
    @reviews = @game.reviews
  end

  def edit
    @game = Game.find(params[:game_id])
    @genres_name = Genre.all
  end

  def update
    @game = Game.find(params[:game_id])
    if @game.update(game_params)
      flash[:notice] = "ゲーム情報を編集しました。"
      redirect_to admin_show_game_path(@game.id)
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(params[:game_id])
    game.destroy
    redirect_to admin_games_path
  end

  private
  def game_params
    params.require(:game).permit(:profile_image,:name,:introduction,:price,:genre_id)
  end
  
  def game_filter_params
    params.permit(:price)
  end
end
