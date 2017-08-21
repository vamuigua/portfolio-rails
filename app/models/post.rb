class Post < ApplicationRecord
  # extend FriendlyId
  # friendly_id :id, use: :slugged
  #post having many comments as commentale
  has_many :comments, as: :commentable
end
