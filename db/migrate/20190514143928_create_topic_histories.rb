class CreateTopicHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_histories do |t|
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true
      t.integer :course_id
      t.integer :score
      t.integer :correct
      t.integer :total
      t.string :data

      t.timestamps
    end
  end
end
