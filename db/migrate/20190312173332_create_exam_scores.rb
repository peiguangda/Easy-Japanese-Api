class CreateExamScores < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_scores do |t|
      t.references :examinfo, foreign_key: true, index: true, limit: 8
      t.references :user, foreign_key: true, index: true
      t.integer :course_id, index: true, limit: 8
      t.string :user_name
      t.integer :status, null: false, index: true
      t.integer :result_status, null: false, default: 100, index: true
      t.string :exam_info_data
      t.integer :total_time
      t.float :total_score, null: false, index: true
      t.float :exam_score, index: true
      t.timestamp :start_date, index: true
      t.integer :current_index, index: true
      t.references :exam_info, foreign_key: true
      t.references :exam_score_data, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
