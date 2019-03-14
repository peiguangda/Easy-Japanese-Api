class CreateCardProgresses < ActiveRecord::Migration[5.2]
  def change
    create_table :card_progresses do |t|
      t.references :user, foreign_key: true, index: true
      t.references :card, foreign_key: true, index: true, limit: 8
      t.integer :course_id, index: true, limit: 8
      t.integer :topic_id, index: true, limit: 8
      t.integer :card_type, default: 0, index: true
      t.integer :skill, null: false, index: true
      t.integer :last_result, default: 0
      t.integer :box_num
      t.integer :difficulty_level
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
