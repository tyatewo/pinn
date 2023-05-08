class Tag < ApplicationRecord

  has_many :gift_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :gifts, through: :gift_tags

  validates :name, presence: true, uniqueness: true

  def save_tag(save_name)
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

end
