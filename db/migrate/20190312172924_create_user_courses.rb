class CreateUserCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_courses do |t|
      t.references :user_info, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :role_type, null: false, default: 0
      t.references :course, foreign_key: true, index: true
      t.timestamp :join_date
      t.timestamp :expire_date
      t.integer :total_time_study, default: 0, limit: 8
      t.integer :status, default: 1, limit: 8
      t.integer :topic_passed, default: 0, index: true
      t.integer :exp, default: 0, index: true, limit: 8
      t.integer :rate_value, default: 5, index: true
      t.string :role_name, default: "student"
      t.string :comment
      t.string :admin_comment

      t.timestamps
    end
  end
end
