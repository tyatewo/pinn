class CreateGifts < ActiveRecord::Migration[6.1]
  def change
    create_table :gifts do |t|

      t.integer :scene_id,     null: false
      t.string :name,          null: false
      t.string :shop_name,     null: false
      t.integer :price,        null: false
      t.text :introduction,    null: false
      t.timestamps
    end
  end
end
