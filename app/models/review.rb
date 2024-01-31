class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comments, dependent: :destroy
  
  validates :review_writing, length: { in: 1..40 } 
end
