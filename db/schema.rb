# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_13_162912) do

  create_table "card_progresses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "card_id", limit: 8
    t.integer "course_id", limit: 8
    t.integer "topic_id", limit: 8
    t.integer "card_type", default: 0
    t.integer "skill", null: false
    t.integer "last_result", default: 0
    t.integer "box_num"
    t.integer "difficulty_level"
    t.integer "progress", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_card_progresses_on_card_id"
    t.index ["card_type"], name: "index_card_progresses_on_card_type"
    t.index ["course_id"], name: "index_card_progresses_on_course_id"
    t.index ["skill"], name: "index_card_progresses_on_skill"
    t.index ["topic_id"], name: "index_card_progresses_on_topic_id"
    t.index ["user_id"], name: "index_card_progresses_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "topic_id", limit: 8
    t.integer "course_id", limit: 8
    t.integer "user_id", limit: 8
    t.integer "order_index"
    t.integer "difficulty_level"
    t.integer "type"
    t.integer "parent_id", limit: 8
    t.integer "has_child", default: 0
    t.integer "status"
    t.string "code"
    t.integer "shuffle_anser", default: 1
    t.string "front_text"
    t.string "front_image"
    t.string "front_sound"
    t.string "front_hint"
    t.string "back_text"
    t.string "back_image"
    t.string "back_sound"
    t.string "back_hint"
    t.string "list_answer"
    t.string "list_correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_cards_on_code"
    t.index ["course_id"], name: "index_cards_on_course_id"
    t.index ["difficulty_level"], name: "index_cards_on_difficulty_level"
    t.index ["has_child"], name: "index_cards_on_has_child"
    t.index ["order_index"], name: "index_cards_on_order_index"
    t.index ["parent_id"], name: "index_cards_on_parent_id"
    t.index ["topic_id"], name: "index_cards_on_topic_id"
    t.index ["type"], name: "index_cards_on_type"
    t.index ["user_id"], name: "index_cards_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.integer "user_id"
    t.string "code"
    t.string "short_description"
    t.string "name", null: false
    t.string "owner_name", null: false
    t.string "avatar", default: ""
    t.string "description", default: ""
    t.string "password", default: "", null: false
    t.string "android_url", default: ""
    t.datetime "end_date", precision: 8
    t.integer "status", null: false
    t.integer "index"
    t.integer "lesson_num", default: 0
    t.integer "member_num", default: 0
    t.integer "time_expire", default: 0
    t.integer "day_to_open_lesson"
    t.integer "type"
    t.string "cost"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_courses_on_code"
    t.index ["index"], name: "index_courses_on_index"
    t.index ["member_num"], name: "index_courses_on_member_num"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "exam_infos", force: :cascade do |t|
    t.integer "type"
    t.integer "question_type", default: 0
    t.integer "course_id", limit: 8
    t.string "full_description", default: ""
    t.string "categories_data"
    t.string "setting_info"
    t.integer "show_result", default: 0
    t.datetime "publish_result_date", precision: 8
    t.integer "barem_score", limit: 8
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exam_infos_on_course_id"
    t.index ["question_type"], name: "index_exam_infos_on_question_type"
    t.index ["type"], name: "index_exam_infos_on_type"
  end

  create_table "exam_score_dts", force: :cascade do |t|
    t.integer "exam_score_id", limit: 8, null: false
    t.integer "pause_time"
    t.string "data"
    t.integer "correct", null: false
    t.integer "incorrect", null: false
    t.integer "play_time"
    t.integer "current_part"
    t.integer "current_time_part"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_score_id"], name: "index_exam_score_dts_on_exam_score_id"
  end

  create_table "exam_score_update_results", force: :cascade do |t|
    t.integer "exam_score_id", limit: 8, null: false
    t.integer "exam_score_data_id", limit: 8, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_score_data_id"], name: "index_exam_score_update_results_on_exam_score_data_id"
    t.index ["exam_score_id"], name: "index_exam_score_update_results_on_exam_score_id"
  end

  create_table "exam_scores", force: :cascade do |t|
    t.integer "examinfo_id", limit: 8
    t.integer "user_id"
    t.integer "course_id", limit: 8
    t.string "user_name"
    t.integer "status", null: false
    t.integer "result_status", default: 100, null: false
    t.string "exam_info_data"
    t.integer "total_time"
    t.float "total_score", null: false
    t.float "exam_score"
    t.datetime "start_date"
    t.integer "current_index"
    t.integer "exam_info_id"
    t.integer "exam_score_data_id"
    t.integer "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_exam_scores_on_course_id"
    t.index ["current_index"], name: "index_exam_scores_on_current_index"
    t.index ["exam_info_id"], name: "index_exam_scores_on_exam_info_id"
    t.index ["exam_score"], name: "index_exam_scores_on_exam_score"
    t.index ["exam_score_data_id"], name: "index_exam_scores_on_exam_score_data_id"
    t.index ["examinfo_id"], name: "index_exam_scores_on_examinfo_id"
    t.index ["result_status"], name: "index_exam_scores_on_result_status"
    t.index ["start_date"], name: "index_exam_scores_on_start_date"
    t.index ["status"], name: "index_exam_scores_on_status"
    t.index ["topic_id"], name: "index_exam_scores_on_topic_id"
    t.index ["total_score"], name: "index_exam_scores_on_total_score"
    t.index ["user_id"], name: "index_exam_scores_on_user_id"
  end

  create_table "exam_settings", force: :cascade do |t|
    t.integer "index"
    t.integer "type"
    t.integer "minute"
    t.string "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "topic_progresses", force: :cascade do |t|
    t.integer "parent_id", limit: 8
    t.integer "topic_id", limit: 8
    t.integer "user_id"
    t.integer "progress", default: 0
    t.integer "content_type", default: 0
    t.integer "status"
    t.integer "numbers_question_essay", default: 0
    t.integer "numbers_question_marked"
    t.integer "view_num", default: 0
    t.integer "passed", default: 0
    t.integer "test_score"
    t.string "user_name"
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["numbers_question_essay"], name: "index_topic_progresses_on_numbers_question_essay"
    t.index ["parent_id"], name: "index_topic_progresses_on_parent_id"
    t.index ["progress"], name: "index_topic_progresses_on_progress"
    t.index ["topic_id"], name: "index_topic_progresses_on_topic_id"
    t.index ["user_id"], name: "index_topic_progresses_on_user_id"
  end

  create_table "topics", force: :cascade do |t|
    t.integer "course_id", limit: 8
    t.integer "user_id", limit: 8
    t.integer "parent_id", limit: 8
    t.integer "type"
    t.integer "level"
    t.integer "status", null: false
    t.integer "childrent_type", null: false
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "tag"
    t.integer "sort_id", limit: 8
    t.integer "order_index"
    t.string "user_name"
    t.string "name", null: false
    t.string "description", default: ""
    t.string "short_description"
    t.string "avatar", default: ""
    t.integer "total_card_num", default: 0
    t.integer "question_number"
    t.string "password"
    t.integer "duration"
    t.integer "pass"
    t.integer "time_practice"
    t.float "score_scale"
    t.integer "viewer"
    t.string "video_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["childrent_type"], name: "index_topics_on_childrent_type"
    t.index ["course_id"], name: "index_topics_on_course_id"
    t.index ["level"], name: "index_topics_on_level"
    t.index ["order_index"], name: "index_topics_on_order_index"
    t.index ["parent_id"], name: "index_topics_on_parent_id"
    t.index ["sort_id"], name: "index_topics_on_sort_id"
    t.index ["status"], name: "index_topics_on_status"
    t.index ["tag"], name: "index_topics_on_tag"
    t.index ["user_id"], name: "index_topics_on_user_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "course_id"
    t.integer "role_type", default: 0, null: false
    t.datetime "join_date"
    t.datetime "expire_date"
    t.integer "total_time_study", limit: 8, default: 0
    t.integer "status", limit: 8, default: 1
    t.integer "topic_passed", default: 0
    t.integer "exp", limit: 8, default: 0
    t.integer "rate_value", default: 5
    t.string "role_name", default: "student"
    t.string "comment"
    t.string "admin_comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["exp"], name: "index_user_courses_on_exp"
    t.index ["rate_value"], name: "index_user_courses_on_rate_value"
    t.index ["topic_passed"], name: "index_user_courses_on_topic_passed"
    t.index ["user_id"], name: "index_user_courses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "encrypted_password", default: "", null: false
    t.string "auth_token", default: ""
    t.string "account", null: false
    t.string "email", null: false
    t.string "full_name", default: ""
    t.string "phone_number", default: ""
    t.string "description", default: ""
    t.string "avatar_url", default: ""
    t.integer "gender", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account"], name: "index_users_on_account"
    t.index ["auth_token"], name: "index_users_on_auth_token"
    t.index ["email"], name: "index_users_on_email"
    t.index ["full_name"], name: "index_users_on_full_name"
    t.index ["phone_number"], name: "index_users_on_phone_number"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
