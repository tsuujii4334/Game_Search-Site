class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_avatar
  
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_games, through: :bookmarks, source: :game
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  
  def get_profile_avatar(width,height)
    unless profile_avatar.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_avatar.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_avatar.variant(resize_to_limit: [width, height]).processed
  end

  # def active_for_authentication?#退会したユーザー(退会ステータスが退会の状態)が再度ログインできないようなルールを設定
  #   super && (is_deleted == false)
  # end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
