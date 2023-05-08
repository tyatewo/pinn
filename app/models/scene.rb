class Scene < ApplicationRecord

  has_many :gifts, dependent: :destroy

end

# MEMO
# uniqueness: true