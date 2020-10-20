class Post < ApplicationRecord

	belongs_to :user
	has_many :audios, dependent: :destroy

	accepts_nested_attributes_for :audios
end
