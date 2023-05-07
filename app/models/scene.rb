class Scene < ApplicationRecord

  has_many :gifts, dependent: :destroy, uniqueness: true

end
