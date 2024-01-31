class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  
  validates :comment_writing, length: { in: 1..40 } 
end