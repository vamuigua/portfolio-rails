class Project < ApplicationRecord
	mount_uploader :projectimage, ProjectimageUploader
	validates :title, :description,:link, presence: true
end
