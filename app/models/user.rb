class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :bookmarks
  has_many :comments
  has_many :reviews
  
  def get_avatar(width,height)
    unless avatar.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    avatar
  end

  def active_for_authentication?#退会したユーザー(退会ステータスが退会の状態)が再度ログインできないようなルールを設定
    super && (is_deleted == false)
  end
end
