class Genre < ApplicationRecord
  has_many :games
  
  def self.looks(search, word)
    if search == "perfect_match"
      @genre = Genre.where("gnere_name LIKE?","#{word}")
    elsif search == "forward_match"
      @genre = Genre.where("genre_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @genre = Genre.where("genre_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @genre = Genre.where("genre_name LIKE?","%#{word}%")
    else
      @genre = Genre.all
    end
  end
end
