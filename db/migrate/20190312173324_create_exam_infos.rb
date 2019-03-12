class CreateExamInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_infos do |t|
      t.integer :type, index: true
      t.integer :question_type, default: 0, index: true
      t.references :course, foreign_key: true, index: true, limit: 8
      t.string :full_description, default: ""
      t.string :categories_data
      t.string :setting_info
      t.integer :show_result, default: 0
      t.timestamp :publish_result_date, limit: 8
      t.integer :barem_score, limit: 8

      t.timestamps
    end
  end
end
