class Admin::SearchesController < ApplicationController
  def index
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @games = Game.looks(params[:search], params[:word])
    end
    
  end
  
  def search
    @range = params[:range]
    @word = params[:word]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @games = Game.looks(params[:search], params[:word])
    end
  end
end
