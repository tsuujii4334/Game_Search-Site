class Game < ApplicationRecord

  has_one_attached :profile_image
  
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @game = Game.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @game = Game.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @game = Game.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @game = Game.where("name LIKE?","%#{word}%")
    else
      @game = Game.all
    end
  end
  
  def narrow_down_price
    @free_game = Game.where(price = 0 )#値段で絞り込む機能を実装途中
    @1_500_game = Game.where("(? < price) and (price < ?)", 1,500)
    @501_2000_game = Game.where("501 < price < 2000")
    @2001_5000_game = Game.where(price)
    @5001_game = Game.where(price)
  end
  
end
