class CreateUserInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_infos do |t|
      t.string :account, null: false, index: true
      t.string :email, null: false, unique: true, index: true
      t.string :full_name, default: "", index: true
      t.string :phone_number, default: "", index: true
      t.string :password, null: false
      t.string :description, default: ""
      t.string :avatar_url, default: ""
      t.integer :gender, default: 0

      t.timestamps
    end
  end
end
