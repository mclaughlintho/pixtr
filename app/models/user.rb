class User < ActiveRecord::Base
include Clearance::User

  has_many :galleries, dependent: :destroy
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_images, through: :likes, source: :image
  
  validates :email, presence: true
  validates :username, presence: true
end
