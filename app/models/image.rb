class Image < ActiveRecord::Base
  belongs_to :gallery, dependent: :destroy
  validates :title, presence: true
  validates :url, presence: true
end
