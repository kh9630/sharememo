class CreateStickers < ActiveRecord::Migration[6.1]
  def change
    create_table :stickers do |t|
      t.integer :genre
      t.string :title
      t.string :img_url

      t.timestamps
    end
  end
end

