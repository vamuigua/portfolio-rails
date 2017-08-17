class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  #post having many comments as commentale
  has_many :comments, as: :commentable
end
