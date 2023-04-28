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

ActiveRecord::Schema[7.0].define(version: 2023_04_27_112015) do
  create_table "actions", force: :cascade do |t|
    t.string "project_name"
    t.string "carbonoffset"
    t.string "offsetamount"
    t.string "transaction_id"
    t.string "partner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string "project_name"
    t.string "carbonoffset"
    t.string "offsetamount"
    t.string "partner_id"
    t.string "transaction_id"
    t.string "distribution"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carbonimpacts", force: :cascade do |t|
    t.string "fuel_type"
    t.string "power_source"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.string "passenger"
    t.string "class_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "partners", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
