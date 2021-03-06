class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.references :topic, foreign_key: true, index: true, limit: 8
      t.references :course, foreign_key: true, index: true, limit: 8
      t.references :user, foreign_key: true, index: true, limit: 8
      t.integer :order_index, index: true
      t.integer :difficulty_level, index: true
      t.integer :type, index: true
      t.integer :parent_id, index: true, limit: 8
      t.integer :has_child, default: 0, index: true
      t.integer :status
      t.string :code, index: true
      t.integer :shuffle_anser, default: 1
      t.string :front_text
      t.string :front_image
      t.string :front_sound
      t.string :front_hint
      t.string :back_text
      t.string :back_image
      t.string :back_sound
      t.string :back_hint
      t.string :list_answer
      t.string :list_correct_answer

      t.timestamps
    end
  end
end
