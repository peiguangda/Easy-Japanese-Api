class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :user, foreign_key: true, index: true
      t.string :code, index: true
      t.string :short_description
      t.string :name, null: false
      t.string :owner_name, null: false
      t.string :avatar, default: ""
      t.string :description, default: ""
      t.string :password, null: false, default: ""
      t.string :android_url, default: ""
      t.timestamp :end_date, limit: 8
      t.integer :status, null: false
      t.integer :index, index: true
      t.integer :lesson_num, default: 0
      t.integer :member_num, default: 0, index: true
      t.integer :time_expire, default: 0
      t.integer :day_to_open_lesson
      t.integer :type
      t.string :cost
      t.string :language

      t.timestamps
    end
  end
end
