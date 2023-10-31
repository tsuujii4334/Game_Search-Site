class ApplicationController < ActionController::Base
  # deviseコントローラにストロングパラメータを追加
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile_avatar, :email, :encrypted_password])
  end
  # 編集画面から画像を受け取れるよう設定
  def configure_account_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_avatar])
  end

end
