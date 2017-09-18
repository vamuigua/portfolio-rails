class Comment < ApplicationRecord
  #comments having many comments as commentable
  #and belonging dynamicaly to other models using polymorphism
  validates :content, presence: true
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable
end
