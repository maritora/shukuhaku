class Room < ApplicationRecord
  has_many :posts
  belongs_to:user

  validates :title, presence: true,
                    length:{minimum:5}
  has_one_attached :image
  
  def self.search(keyword)
        where(["name like? OR addess like?", "%#{keyword}%", "%#{keyword}%"])
  end
end
