class GiftTag < ApplicationRecord

  belongs_to :gift
  belongs_to :tag

  validates :gift_id, presence: true #空じゃないこと
  validates :tag_id, presence: true #空じゃないこと

end
