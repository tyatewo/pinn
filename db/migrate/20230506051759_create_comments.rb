class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :customer_id,      null: false
      t.integer :gift_id,          null: false
      t.integer :body,             null: false
      t.timestamps
    end
  end
end
