class Image < ActiveRecord::Base
  belongs_to :gallery
  belongs_to :user
  has_many :image_tags
  has_many :tags, through: :image_tags
  
  validates :title, presence: true
  validates :url, presence: true
  
end
