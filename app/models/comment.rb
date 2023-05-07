class Comment < ApplicationRecord

  has_many :gifts, dependent: :destroy
  has_many :customers, dependent: :destroy

end
