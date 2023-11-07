class Admin::GenresController < ApplicationController
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンル作成に成功しました。"
      redirect_to admin_genres_path
    else
      render :index
    end
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:genre_id])
  end

  def update
    genre = Genre.find(params[:genre_id])
    if genre.update(genre_params)
       flash[:notice] = "ジャンルの更新に成功しました。"
       redirect_to admin_genres_path
    else
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
