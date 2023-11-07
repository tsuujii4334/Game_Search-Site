class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    is_matching_login_user
    @user = current_user
    @user.update(user_params)
    redirect_to mypage_user_path
  end

  def confirm
  end
  
  def withdrawal
    @user = User.find(current_user.id)
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end
  
private
  def user_params
    params.require(:user).permit(:avatar, :name, :email)
  end

  def is_matching_login_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to root_path
    end
  end
  
end
