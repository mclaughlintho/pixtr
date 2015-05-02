class User < ActiveRecord::Base
  has_many :galleries, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
end
