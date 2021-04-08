class CreateShortcuts < ActiveRecord::Migration[6.1]
  def change
    create_table :shortcuts do |t|
      t.boolean :is_valid
      t.string :title
      t.integer :user_id
      t.string :content
      t.string :color
      t.datetime :work_time
      t.boolean :is_alarm
      t.string :alarm_timing
      t.timestamps
    end
  end
end
