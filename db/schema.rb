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

ActiveRecord::Schema[7.0].define(version: 2023_03_25_163648) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "final_girls", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_final_girls_on_series_id"
  end

  create_table "killer_achievements", force: :cascade do |t|
    t.bigint "killer_id", null: false
    t.text "description"
    t.boolean "has_locations", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["killer_id"], name: "index_killer_achievements_on_killer_id"
  end

  create_table "killers", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_killers_on_series_id"
  end

  create_table "location_achievements", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.text "description"
    t.boolean "has_killers", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_achievements_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["series_id"], name: "index_locations_on_series_id"
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "final_girl_id", null: false
    t.bigint "killer_id", null: false
    t.bigint "location_id", null: false
    t.boolean "is_win", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "extreme_horror_mode", default: false
    t.index ["final_girl_id"], name: "index_plays_on_final_girl_id"
    t.index ["killer_id"], name: "index_plays_on_killer_id"
    t.index ["location_id"], name: "index_plays_on_location_id"
    t.index ["user_id"], name: "index_plays_on_user_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_killer_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "killer_achievement_id", null: false
    t.bigint "location_id"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["killer_achievement_id"], name: "index_user_killer_achievements_on_killer_achievement_id"
    t.index ["location_id"], name: "index_user_killer_achievements_on_location_id"
    t.index ["user_id"], name: "index_user_killer_achievements_on_user_id"
  end

  create_table "user_location_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_achievement_id", null: false
    t.bigint "killer_id"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["killer_id"], name: "index_user_location_achievements_on_killer_id"
    t.index ["location_achievement_id"], name: "index_user_location_achievements_on_location_achievement_id"
    t.index ["user_id"], name: "index_user_location_achievements_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "final_girls", "series"
  add_foreign_key "killer_achievements", "killers"
  add_foreign_key "killers", "series"
  add_foreign_key "location_achievements", "locations"
  add_foreign_key "locations", "series"
  add_foreign_key "plays", "final_girls"
  add_foreign_key "plays", "killers"
  add_foreign_key "plays", "locations"
  add_foreign_key "plays", "users"
  add_foreign_key "user_killer_achievements", "killer_achievements"
  add_foreign_key "user_killer_achievements", "locations"
  add_foreign_key "user_killer_achievements", "users"
  add_foreign_key "user_location_achievements", "killers"
  add_foreign_key "user_location_achievements", "location_achievements"
  add_foreign_key "user_location_achievements", "users"
end
