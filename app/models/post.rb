class Post < ApplicationRecord
  extend FriendlyId
  has_rich_text :content
  has_one_attached :cover, dependent: :destroy
  has_many_attached :images, dependent: :destroy
  friendly_id :title, use: :slugged
end
