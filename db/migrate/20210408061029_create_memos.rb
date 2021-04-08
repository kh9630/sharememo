class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.string :title
      t.string :content
      t.integer :sticker_id
      t.boolean :is_always
      t.boolean :is_all_day
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :is_alarm
      t.string :alarm_timing
      t.timestamps
    end
  end
end
