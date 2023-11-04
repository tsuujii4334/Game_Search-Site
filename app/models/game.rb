class Game < ApplicationRecord

  has_one_attached :profile_image
  
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  
  validates :name, length: { in: 1..30 } 
  validates :introduction, length: { in: 1..75 }
  validates :price, numericality: true
  
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
  
  def self.filter_price(params)
    if params[:price].present?
      case params[:price]
      when "0"
        where(price: 0)
      when "1..500"
        where(price: 1..500)
      when "501..2000"
        where(price: 501..2000)
      when "2001..5000"
        where(price: 2001..5000)
      when "5001.."
        where("price >= ?",5001)
      else
        all
      end
    else
      all
    end
  end
  
end
