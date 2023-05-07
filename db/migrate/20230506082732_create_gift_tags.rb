class CreateGiftTags < ActiveRecord::Migration[6.1]
  def change
    create_table :gift_tags do |t|
      t.integer :tag_id,     null: false
      t.integer :gift_id,    null: false
      t.timestamps
    end
  end
end
