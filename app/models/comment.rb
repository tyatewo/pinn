class Comment < ApplicationRecord

  belongs_to :gift
  belongs_to :customer

end
