class Audio < ApplicationRecord

	belongs_to :post

	mount_uploader :audio, AudioFileUploader

  validates :audio, presence: true
end
