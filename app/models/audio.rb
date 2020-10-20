class Audio < ApplicationRecord

	belongs_to :post

	mount_uploader :file, AudioFileUploader

  validates :file, presence: true
end
