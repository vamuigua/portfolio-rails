class Post < ApplicationRecord
  mount_uploader :postimage, PostimageUploader
  validates :title, :content, presence: true
  #post having many comments as commentale
  has_many :comments, as: :commentable, dependent: :destroy
end
