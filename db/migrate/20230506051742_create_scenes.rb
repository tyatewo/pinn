class CreateScenes < ActiveRecord::Migration[6.1]
  def change
    create_table :scenes do |t|
      t.string :name,          null: false
      t.timestamps
    end
  end
end
