class Gift < ApplicationRecord
  has_one_attached :gift_image

  validates :name,          presence: true
  validates :shop_name,     presence: true
  validates :price,         presence: true
  validates :introduction,  presence: true

  has_many :gift_tags, dependent: :destroy
  has_many :tags,      through: :gift_tags
  has_many :bookmarks, dependent: :destroy
  has_many :comments,  dependent: :destroy

  belongs_to :customer
  belongs_to :scene


  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :bookmark_count, -> {left_joins(:bookmarks).order(gift_id: :desc)}


  def save_tag(sent_tags)
    # unless=タグそのものが存在しているか？を確認
    # pluck=カラムの中身を展開してくれる
    current_tags = self.tags.pluck(:name) unless self.tags.nil? # タグが存在していれば、タグの名前を配列として全て取得
    old_tags = current_tags - sent_tags #古タグ＝今すでにあるタグ-新しく送信したタグ 現在取得したタグから送られてきたタグを除いてoldtagとする
    new_tags = sent_tags - current_tags # 新タグ＝新しく送信したタグ-今すでにあるタグ 送信されてきたタグから現在存在するタグを除いたタグをnewとする

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end

  def self.search(search)
    if search
      Gift.where(['content LIKE ?', "%#{search}%"])
    else
      Gift.all
    end
  end

  def bookmarked_by?(customer)
    customer.present? && bookmarks.exists?(customer_id: customer.id)
  end


end
