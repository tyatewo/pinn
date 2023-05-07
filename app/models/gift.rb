class Gift < ApplicationRecord
  has_one_attached :gift_image

  validates :scene_id,      presence: true
  validates :name,          presence: true
  validates :shop_name,     presence: true
  validates :price,         presence: true
  validates :introduction,  presence: true

  has_many :tags,      through: :gift_tags
  has_many :gift_tags, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :comments,  dependent: :destroy

  belongs_to :customer
  belongs_to :genre
end
