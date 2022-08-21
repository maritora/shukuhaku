class Post < ApplicationRecord
 
  validates :start, presence: true
  validates :end, presence: true
  validates :ninzu, presence: true
  
  belongs_to :user
  belongs_to :room
end
