class Scene < ApplicationRecord

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }, uniqueness: true

  has_many :gifts, dependent: :destroy

end

# MEMO
# uniqueness: true