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

ActiveRecord::Schema[7.0].define(version: 2023_03_27_135512) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", precision: nil, null: false
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", precision: nil, null: false
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
  end

  create_table "final_girls", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "killer_achievements", force: :cascade do |t|
    t.bigint "killer_id", null: false
    t.text "description"
    t.boolean "has_locations", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "killers", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "location_achievements", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.text "description"
    t.boolean "has_killers", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "series_id", null: false
    t.string "name"
    t.string "slug"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "plays", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "final_girl_id", null: false
    t.bigint "killer_id", null: false
    t.bigint "location_id", null: false
    t.boolean "is_win", default: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "extreme_horror_mode", default: false
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "user_killer_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "killer_achievement_id", null: false
    t.bigint "location_id"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "user_location_achievements", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_achievement_id", null: false
    t.bigint "killer_id"
    t.boolean "completed", default: false, null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "admin", default: false
    t.string "username"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id", name: "active_storage_attachments_blob_id_fkey"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id", name: "active_storage_variant_records_blob_id_fkey"
  add_foreign_key "final_girls", "series", name: "final_girls_series_id_fkey"
  add_foreign_key "killer_achievements", "killers", name: "killer_achievements_killer_id_fkey"
  add_foreign_key "killers", "series", name: "killers_series_id_fkey"
  add_foreign_key "location_achievements", "locations", name: "location_achievements_location_id_fkey"
  add_foreign_key "locations", "series", name: "locations_series_id_fkey"
  add_foreign_key "plays", "final_girls", name: "plays_final_girl_id_fkey"
  add_foreign_key "plays", "killers", name: "plays_killer_id_fkey"
  add_foreign_key "plays", "locations", name: "plays_location_id_fkey"
  add_foreign_key "plays", "users", name: "plays_user_id_fkey"
  add_foreign_key "user_killer_achievements", "killer_achievements", name: "user_killer_achievements_killer_achievement_id_fkey"
  add_foreign_key "user_killer_achievements", "locations", name: "user_killer_achievements_location_id_fkey"
  add_foreign_key "user_killer_achievements", "users", name: "user_killer_achievements_user_id_fkey"
  add_foreign_key "user_location_achievements", "killers", name: "user_location_achievements_killer_id_fkey"
  add_foreign_key "user_location_achievements", "location_achievements", name: "user_location_achievements_location_achievement_id_fkey"
  add_foreign_key "user_location_achievements", "users", name: "user_location_achievements_user_id_fkey"
end
