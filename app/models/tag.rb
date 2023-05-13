class Tag < ApplicationRecord

  has_many :gift_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :gifts, through: :gift_tags

  validates :name, presence: true, uniqueness: true


end
