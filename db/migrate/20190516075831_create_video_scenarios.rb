class CreateVideoScenarios < ActiveRecord::Migration[5.2]
  def change
    create_table :video_scenarios do |t|
      t.references :topic, foreign_key: true
      t.integer :course_id
      t.integer :auto_play, default: 0
      t.integer :status, default: 0
      t.integer :type_scenario, default: 1
      t.timestamp :start_time
      t.timestamp :end_time
      t.string :video_url, null: false
      t.integer :time_question_data, default: 10000000
      t.string :title, default: ""
      t.string :description, default: ""
      t.string :thumbnail, default: ""
      t.boolean :is_must_answer, default: false
      t.boolean :is_must_answer_correct, default: false

      t.timestamps
    end
  end
end
