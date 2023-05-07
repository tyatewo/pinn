class Tag < ApplicationRecord

  has_many :gift_tags
  has_many :gifts, through: :gift_tags

  validates :name, presence: true

end
