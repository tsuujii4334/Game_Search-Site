class Admin::GenresController < ApplicationController
  def new
    @genres = Genre.new
  end
  
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
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres_path
  end
  
  private
  def genre_params
    params.require(:genre).permit(:genre_name)
  end
end
