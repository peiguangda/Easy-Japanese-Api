class CreateTopicProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_progresses do |t|
      t.integer :parent_id, index: true, limit: 8
      t.references :topic, foreign_key: true, index: true, limit: 8
      t.references :user_info, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :course_id, index: true, limit: 8
      t.integer :progress, default: 0, index: true
      t.integer :content_type, default: 0
      t.integer :status
      t.integer :numbers_question_essay, default: 0, index: true
      t.integer :numbers_question_marked
      t.integer :view_num, default: 0
      t.integer :passed, default: 0
      t.integer :test_score
      t.string :user_name
      t.string :category_name

      t.timestamps
    end
  end
end
