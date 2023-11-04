class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]
  def show
    @user = current_user
  end

  def edit
    @user = current_user
    if @user.id == current_user.id
      redirect_to edit_user_path
    else
      redirect_to root_path
    end
  end
  
  def update
    @user = current_user
    if @user.id == current_user.id
      @user.update(user_params)
      redirect_to mypage_user_path
    else
      render :edit
    end
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
