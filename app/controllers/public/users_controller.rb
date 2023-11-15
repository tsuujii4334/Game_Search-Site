class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to mypage_user_path
  end

  def confirm
    @user = User.find(current_user.id)
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
    params.require(:user).permit(:profile_avatar, :name, :email)#paramが見つからないか空になってしまう
  end

end
