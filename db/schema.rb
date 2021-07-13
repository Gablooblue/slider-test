# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_13_020902) do

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "allocation_items", force: :cascade do |t|
    t.integer "allocation_test_id", null: false
    t.string "name"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["allocation_test_id"], name: "index_allocation_items_on_allocation_test_id"
  end

  create_table "allocation_tests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "lottery_won"
    t.index ["user_id"], name: "index_allocation_tests_on_user_id"
  end

  create_table "choice_tests", force: :cascade do |t|
    t.integer "test_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "correct_slides"
    t.integer "gamble"
    t.index ["test_id"], name: "index_choice_tests_on_test_id"
    t.index ["user_id"], name: "index_choice_tests_on_user_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "choice_test_id", null: false
    t.boolean "answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "rewarded", default: false
    t.boolean "lucky", default: false
    t.index ["choice_test_id"], name: "index_choices_on_choice_test_id"
  end

  create_table "gambles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_gambles_on_user_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "total"
    t.integer "choices_accomplished"
    t.integer "choice_score"
    t.integer "sliders_accomplished"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "lottery_points"
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "slides", force: :cascade do |t|
    t.float "score"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "test_id", null: false
    t.index ["test_id"], name: "index_slides_on_test_id"
    t.index ["user_id"], name: "index_slides_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "allocation_items", "allocation_tests"
  add_foreign_key "allocation_tests", "users"
  add_foreign_key "choice_tests", "tests"
  add_foreign_key "choice_tests", "users"
  add_foreign_key "choices", "choice_tests"
  add_foreign_key "gambles", "users"
  add_foreign_key "results", "users"
  add_foreign_key "slides", "tests"
  add_foreign_key "slides", "users"
  add_foreign_key "tests", "users"
end
