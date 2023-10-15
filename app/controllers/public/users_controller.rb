class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end
  
  def update
    user = current__user
    user.update(user_params)
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
  
  def user_params
    params.require(:user).permit(:avatar, :name, :email)
  end
  
end
