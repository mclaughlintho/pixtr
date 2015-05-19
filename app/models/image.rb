class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  has_many :image_tags
  has_many :tags, through: :image_tags
  has_many :comments
  
  has_many :likes, dependent: :destroy
  has_many :user_likes, class_name: "Likes",
                        foreign_key: "image_id"
  
  validates :title, presence: true
  validates :url, presence: true
  
end
