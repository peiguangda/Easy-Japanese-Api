class CreateExamScoreUpdateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_score_update_results do |t|
      t.integer :exam_score_id, null: false, index: true, limit: 8
      t.integer :exam_score_data_id, null: false, index: true, limit: 8

      t.timestamps
    end
  end
end
