class Image < ActiveRecord::Base
  belongs_to :gallery
  validates :title, presence: true
  validates :url, presence: true
  
  def gallery
    self.gallery_id
  end
  
end
