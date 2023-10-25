class Admin::UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
       redirect_to admin_users_path
    else
       render :show
    end
  end
    private
  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
