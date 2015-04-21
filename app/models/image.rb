class Image < ActiveRecord::Base
  belongs_to :gallery, dependent: :destroy
end
