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
      if params[:user][:is_deleted] == "false"
        @user.update_attribute(:is_deleted, false)  # 退会状態から登録中状態に更新
        flash[:success] = "会員ステータスを登録中に変更しました。"
      elsif params[:user][:is_deleted] == "true"
        @user.update_attribute(:is_deleted, true)   # 登録中状態から退会状態に更新
        flash[:success] = "会員ステータスを退会に変更しました。"
      end
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
