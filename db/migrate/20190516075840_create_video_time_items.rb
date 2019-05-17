class CreateVideoTimeItems < ActiveRecord::Migration[5.2]
  def change
    create_table :video_time_items do |t|
      t.references :video_scenario, foreign_key: true
      t.string :list_card_id, null: false
      t.integer :index
      t.integer :time_practice, default: 1000000
      t.string :title, default: ""
      t.string :code, default: ""
      t.string :data
      t.integer :start_time, null: false

      t.timestamps
    end
  end
end
