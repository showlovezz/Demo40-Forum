class Post < ApplicationRecord
	belongs_to :user
	validates :title, presence: true, length: { minimum: 5 }
	validates :content, presence: true
	validates :image, presence: true
	mount_uploader :image, PhotoUploader
	has_many :comments, dependent: :destroy

	# has_one_attached :image
end
