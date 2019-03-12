class CreateExamScoreDts < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_score_dts do |t|
      t.integer :exam_score_id, null: false, index: true, limit: 8
      t.integer :pause_time
      t.string :data
      t.integer :correct, null: false
      t.integer :incorrect, null: false
      t.integer :play_time
      t.integer :current_part
      t.integer :current_time_part

      t.timestamps
    end
  end
end
