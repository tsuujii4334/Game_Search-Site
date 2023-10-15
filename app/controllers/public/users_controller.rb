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
  
  def withd
    
  end
  
  def item_params
    params.require(:user).permit(:avatar, :name, :email)
  end
  
end
