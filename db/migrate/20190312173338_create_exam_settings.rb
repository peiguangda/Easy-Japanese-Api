class CreateExamSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :exam_settings do |t|
      t.integer :index
      t.integer :type
      t.integer :minute
      t.string :content

      t.timestamps
    end
  end
end
