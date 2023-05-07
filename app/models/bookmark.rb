class Bookmark < ApplicationRecord

  has_many :gifs, dependent: :destroy
  has_many :customers, dependent: :destroy

end
