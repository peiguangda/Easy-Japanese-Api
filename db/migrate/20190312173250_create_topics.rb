class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.references :course, foreign_key: true, index: true, limit: 8
      t.references :user, foreign_key: true, index: true, limit: 8
      t.integer :parent_id, index: true, limit: 8
      t.integer :type
      t.integer :level, index: true
      t.integer :status, null: false, index: true
      t.integer :childrent_type, null: false, index: true
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :tag, index: true
      t.integer :sort_id, index: true, limit: 8
      t.integer :order_index, index: true
      t.string :user_name
      t.string :name, null: false
      t.string :description, default: ""
      t.string :short_description
      t.string :avatar, default: ""
      t.integer :total_card_num, default: 0
      t.integer :question_number
      t.string :password
      t.integer :duration
      t.integer :pass
      t.integer :time_practice
      t.float :score_scale
      t.integer :viewer

      t.timestamps
    end
  end
end
