class User < ActiveRecord::Base
include Clearance::User

  has_many :galleries, dependent: :destroy
  has_many :images, dependent: :destroy
  validates :email, presence: true
end
